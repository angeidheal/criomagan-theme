---
layout: page
title: Projects
permalink: /projects/
---

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  {% for project in site.data.projects %}
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg overflow-hidden flex flex-col">
      <div class="relative">
        <a href="{{ project.url }}" class="block w-full hover:opacity-90 transition-opacity">
          <img src="{{ project.image }}" alt="{{ project.title }}" class="w-full object-contain">
        </a>
      </div>
      <div class="p-6">
        <a href="{{ project.url }}" class="block hover:text-blue-600 dark:hover:text-blue-400">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white">{{ project.title }}</h3>
        </a>
        <p class="text-gray-600 dark:text-gray-400 mt-2">{{ project.description }}</p>
      </div>
    </div>
  {% endfor %}
</div> 