package com.surrus.peopleinspace.ui

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.surrus.common.remote.Assignment
import com.surrus.common.repository.PeopleInSpaceRepository
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch

class PeopleInSpaceViewModel(peopleInSpaceRepository: PeopleInSpaceRepository) : ViewModel() {
    val peopleInSpace = MutableLiveData<List<Assignment>>(emptyList())

    init {
        viewModelScope.launch {
//            peopleInSpaceRepository.fetchPeopleAsFlow().collect {
//                peopleInSpace.value = it
//            }

            //peopleInSpace.postValue(peopleInSpaceRepository.fetchPeople())

            peopleInSpaceRepository.fetchPeople {
                peopleInSpace.postValue(it)
            }

        }

    }


    suspend fun someFun(success: (String) -> Unit) {
        success("hi")
    }

}