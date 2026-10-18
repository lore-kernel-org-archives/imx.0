Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2160C3D567E
	for <imx@lists.linux.dev>; Sun, 18 Oct 2026 23:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364933; cv=none; b=SGnd3rDruGM8agVMvPHy2FyVFGmNUvIFaA8MOm5J8lsekkV5IZBR5pK1rnw+UmnewH6uFdDwHqXbelVbh2nXvCE4h09a6nLHYwMCgnve6pYwVsEWeSLEawHpBXx4mK9HnJc59bslsTyD2vnTiwfov2fKv/aCFWtvv8w3USFbV64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364933; c=relaxed/simple;
	bh=p8FTZwp7s1J462QVoBrEFFiN89DV/HAT5ftad7mb7JU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=M/47iK5VMbkwuYd9SmDtwPIFClsCx63CCLPBNgYLvn8GzHY78XFlqiQT9kEAwGMqcaw7igNDDm/UT3pumVlvtjyMyorj2mVlaRSncAkeOCiZWZQHcL4c85qcSTi8rsVUch1GohlXgJz+GeBGibnAHAIfWjc0Z5uK7bVBn6Wp/WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=HcRIvfCM; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="HcRIvfCM"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB17C107C6D;
	Mon, 19 Oct 2026 01:08:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792364926;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/n6+4JQiywJjQ1A9yAO3+Augm5SZEQ9TEZ+ptln5pQQ=;
	b=HcRIvfCMWEq7fB6bj5ULHqxq9G25FyUmh/ZpgnmqeSnT0nnVbvV+biDvV2zJ/DRnFtGG3T
	b36TcfhIlZ3bI5wPx9hhjn6yT3xKLT6xHv99PvBGHDdLk1V+ZZewFPLtU9OoA9UM8NghG8
	YbzOzLNDaad9/b136x+27M8y6g6+p00ir/5PDvf+1qYYXcEU8TYEVAImexqrGuBLp6dJKw
	iwVvb3qrjWNLSnr9SoRLy34hEYtHuj/NSK95y7YDSD03AlcxTen/ygDFN8zeEcj8WVk5E3
	B2TuOz1MVHZoa7p6Wif/nnRDVnJWv2aVpTAM4+U9QZOMNN6QHcK83sx/cI5i6w==
Message-ID: <d5a72893-fa46-49df-8ba1-8abaec8de621@nabladev.com>
Date: Mon, 19 Oct 2026 00:19:50 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/imx: upstream direction for i.MX95 display support
From: Marek Vasut <marex@nabladev.com>
To: Liu Ying <victor.liu@nxp.com>, Piyush Patle <piyushpatle228@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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
 <akxjwULa-p6c6IvR@raspi> <c43103f6-348c-48b9-a831-ecb9379ce46f@nabladev.com>
Content-Language: en-US
In-Reply-To: <c43103f6-348c-48b9-a831-ecb9379ce46f@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/21/26 8:40 PM, Marek Vasut wrote:
> On 7/7/26 4:26 AM, Liu Ying wrote:
> 
> Hi,
> 
>> I need to point out that i.MX95 display controller also has 2 display 
>> engines
>> and 1 pixel engine, which is something missing in your code.  This 
>> makes me
>> think that you have no enough i.MX95 display controller documents.
>>
>> Generally speaking, I'd say there is a lot to be improved before 
>> posting the
>> formal patch series.  Gut feeling is that maybe it's a bit too difficult
>> for you to get the drivers right.  As I said earlier, my original plan 
>> is to
>> add i.MX8QXP prefetch engine support first with the posted patch 
>> series and
>> then to add i.MX95 display controller support, but maybe I can try to 
>> add the
>> latter first - just need to find a time slot.  However, adding 
>> prefetch engine
>> support first would directly show a reason to people why two DRM 
>> drivers are
>> warranted when adding i.MX95 display controller support.
> 
> I haven't seen any MX95 DPU patches posted (except for my work from last 
> year), was there any progress since this discussion ?

+CC Daniel
