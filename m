Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9D54F4032
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 18:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016053; cv=none; b=gN1kM42+gtApfmDNVx3TeMOSwn81jqs7ZoJiC0ojFTUIrI6CoeXATMgJWmYfmIA1Kmy932lgIYYjBQAVGNexeJiuUEsxbPMsiXrJU76c/IGwrvG7twvvdfDuU41BDrujGK2JgwfkXepZ76ZOldo49GpUzbWyO8iKEf/THbssfZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016053; c=relaxed/simple;
	bh=wNiX/VO6NezrnATN22n1YaO9AbiypeoonzYaatwdwOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+wuQOyRdtLGIj77N8w1SGNkOsBbtl1Zz2AEMY2GDG2aCtvP1wJ0J/HUnkQACtRzCXFZPKBCZPEpPuLTjX+FpQFNoWytq1FdXbb4f8cygndAOTcdvXY43qJCUCnFYK+cbJnoxr8TOckssv5A2+03E3S9Fwq+lc2umUryFQzZLB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=CvmdGQZE; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="CvmdGQZE"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1EA91034B8;
	Mon, 21 Sep 2026 20:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790016045;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1IYSOWDSdVHavPw5AagIbmQivLGnywmbta0NyEZGhlY=;
	b=CvmdGQZE6caIekfX+VDVlUD40Y5GvROg5DGKfHwS7TBY3BImNPFYKzza7e1TKqC4dD/vKK
	THgiqTiqT0Ri5qTYOVW5R389tgFAZEd2CFeWc3H+d3l+mccWIgsCzOoD4nmIAEmMdvhuQZ
	Czyj3A1NtzviXQA9VFjLjePVN6xQACIQ8YJJMjHP8nfeU9JOaQiooFdy+SkVU8ls4op29b
	v/PuV8XzpIWGdTCDc0Qbqk9T+ljPBzEfl+tLgBgQd6yBTwrwglyP2ktPmNjZItmUquh4V/
	Pqrt1zY+WuQlRjQ6QCMaQsBMr+pXlhzUkv55tN35mV+6m7+ZWBbHkdGyYjhnKw==
Message-ID: <c43103f6-348c-48b9-a831-ecb9379ce46f@nabladev.com>
Date: Mon, 21 Sep 2026 20:40:38 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/imx: upstream direction for i.MX95 display support
To: Liu Ying <victor.liu@nxp.com>, Piyush Patle <piyushpatle228@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, daniel.baluta@nxp.com,
 Frank.Li@nxp.com, shawnguo@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
References: <20260624100326.413699-1-piyushpatle228@gmail.com>
 <aj5MNiKSCiEDvDzL@raspi>
 <CAMB+xkayaViXeC2GyMMUfeCMzA4=fh-Dq6NYOL-hzKoLfAF19w@mail.gmail.com>
 <aksVMhFr8YzedE1w@raspi>
 <CAMB+xkY2rut-sEUMyFnXqYCNmyseP4nAGj4BfreORTTM=SN8_g@mail.gmail.com>
 <akuEOT2FRa77L0Jn@raspi>
 <CAMB+xka8Fame7aFZSiWEtVcozSTXX8g9MKJu+cycU2vtiSDHmQ@mail.gmail.com>
 <akxjwULa-p6c6IvR@raspi>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <akxjwULa-p6c6IvR@raspi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/7/26 4:26 AM, Liu Ying wrote:

Hi,

> I need to point out that i.MX95 display controller also has 2 display engines
> and 1 pixel engine, which is something missing in your code.  This makes me
> think that you have no enough i.MX95 display controller documents.
> 
> Generally speaking, I'd say there is a lot to be improved before posting the
> formal patch series.  Gut feeling is that maybe it's a bit too difficult
> for you to get the drivers right.  As I said earlier, my original plan is to
> add i.MX8QXP prefetch engine support first with the posted patch series and
> then to add i.MX95 display controller support, but maybe I can try to add the
> latter first - just need to find a time slot.  However, adding prefetch engine
> support first would directly show a reason to people why two DRM drivers are
> warranted when adding i.MX95 display controller support.

I haven't seen any MX95 DPU patches posted (except for my work from last 
year), was there any progress since this discussion ?
