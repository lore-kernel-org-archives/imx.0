Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF67225A3D
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127361; cv=none; b=ZIaNPlQ9CJ00OZnjUT7dYgc6kfDrrLVDlTPwScNnjHavp7T81ThiwSN3u1MzJoOPN/fK6Ay3RHOK6eCsT11c90koFDlKMYFJy8sszam0vrkFZS0VwhqpbsJ2XiEFAjXZ2+9mwC1OQaB5Ofx3O3DUx+LRQltjYAmUEMa/99cCEFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127361; c=relaxed/simple;
	bh=qw95CvdMmCrTiI2QSJae3SJp8u12cU/mjgFB23QBOoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4XLHLLQUxyt6Xvc1aSvehsXQl13HdBNveUo+kUaijxhNs0PCgLQdgHtlLtkP308xzxerZhCWY6g0dgGGRFVUG+JCjm7qZr18lYjq4S6CYx/5sWo5foWWrITr0AoMVXpcqQoNWuZMfV4pWnKzzZYFxosWyJvb7S1EbzPMFzs7Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoHzTjLd; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoHzTjLd"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so1738318b3a.0
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 05:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127360; x=1763732160; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scABYrWfLMryk0p1vRaa9SSZUmq5nZBEo0AWWVBIqSc=;
        b=HoHzTjLds2K+++sUQPNjH/kLDVvnwb4wD4p/DNgOWm4qDTKhr/7no1NeDKOsItP7lZ
         ovJM9QCNrnawNvQEEr5u/y2dX773o5LWbL9zi6pxBlYO82BvlO8WLgG7oFg/eLoTWl1i
         MYVn7XdNNbI9NUBUvt3VrTbRCII7+b2WnjjDEI9u5c7KuKxYZGfElRpSv4DsshI5f3Nb
         BmqebKi/L8dC+MTVn2cKKnhAQVVoGg9tdFnM4vzCU59rI8EuhWLcoalVcrdMVRa4X+dH
         EvFLnYFzv4nDoHd3/VahCjaEmkKz+UXXlgazNZyqdsyM9zr9fNP4ij5Xdn1kotW0g9lk
         VRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127360; x=1763732160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scABYrWfLMryk0p1vRaa9SSZUmq5nZBEo0AWWVBIqSc=;
        b=IRM//HLaB1e1TP8jkfd8QMcpMaS7Su6VCzO9tQmSPGKAd8ZtvtPwoY9ZWNw92ZYCSU
         +g/K7+4N/ydzqdpF0RBdxgH1DaP1yUjaN/FHrp7aPSlyiC9KOWLR+/fNlhLazmGxO4gn
         5M5EKdDG9OK9S8/OPWHl9izGns8pKjd3hwGUwOlHrR+ecyis8iXkKLuyBbWtCBD5iQ5j
         zeiJi3yOliGNUzj2Z8J2x10fs/UY9f3hLo5YKLTe2MjlifkUyPX2ac7BNw5KAE267qtp
         CwqHmjlm04fQC89vNaI+mWEHJNpxdtLMi6M/qFkT7oRmHL4zkZS6zGUK8zJJsjjD57/1
         WM0g==
X-Forwarded-Encrypted: i=1; AJvYcCVcrYZCoUaq6qKi59oUkodHQurVHKCt71A0lD8A/uI69jXNYdMjVnQFBbo48StfFcLg4K8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuO7WPkL6Az1uVrgiUwuKfkVRUHRb7vuucwW3JVkeiaSgnv5MD
	ANQhmfGVZ3u4yNubJ4QTK16CGalVF1gbSoxtZ0/R9BaOqu5MGvb4g+00
X-Gm-Gg: ASbGncsfpQ5uS63Kg7V9IPjYq6RBzjJuNcBB9P9rz/WFe0XbjyKWffl4G/JZ1Cq2+lT
	XoA8TJjYmv5TO5J76h/A8dLPH6+v822px5NG6UM4O4BvnTK+ifYtgkIBbImnslLxfCRC74ljyUF
	+R1u1aPwr8NptWRJuSTVKo7PTajPJWu+Tk3iXgNpj/zx+TEVKqQsurdjNdvG2PoMO0EMtE0ZZzF
	8q2uWB089q7PYzP4IYcNvwgTZKSh4AXDz/Ei0XNMAp1rq5m8pSQ1f2K+26SEPL6yLJ7dfjla7H7
	bOpW6Siu/DzgJW51dWTBtwiM53L0X982kyVAZHixoRdyBYUrEDhIs+eC0LjRo0u1eluIOvM05y4
	Ws6bX/zi7ynKij2dhWUgdQyvwXshSZZjz1fEOj7P45AvLriZXSfgYxAOXVbu6ZorE6Bn2ucd73R
	ZkOEXOdmKyPmmmM/loEQ==
X-Google-Smtp-Source: AGHT+IHwhy1vTerg5Gbcyy0Rh5fn/eKlAsIHslT76ScI3eW0anR3tnZ2sM336zTG90LT4R0w1+j48g==
X-Received: by 2002:a05:6a00:2408:b0:781:4f0b:9c58 with SMTP id d2e1a72fcca58-7ba3c080cf8mr3820686b3a.15.1763127359646;
        Fri, 14 Nov 2025 05:35:59 -0800 (PST)
Received: from [192.168.1.50] ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cda04sm5245361b3a.19.2025.11.14.05.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 05:35:58 -0800 (PST)
Message-ID: <99c99fda-a3ab-4575-89fa-8d2e6a3ba4ab@gmail.com>
Date: Fri, 14 Nov 2025 20:35:52 +0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net,
 andersson@kernel.org, mathieu.poirier@linaro.org, dan.j.williams@intel.com,
 cedric.xing@intel.com, pasha.tatashin@soleen.com, kevin.tian@intel.com,
 skhawaja@google.com, yesanishhere@gmail.com, taimoorzaeem@gmail.com,
 linux@treblig.org, arnaud.pouliquen@foss.st.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 rdunlap@infradead.org, imx@lists.linux.dev
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-3-daniel.baluta@nxp.com> <aRcEoX9saonpQuvf@archie.me>
 <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/14/25 18:33, Daniel Baluta wrote:
> On Fri, Nov 14, 2025 at 12:29 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>
>> On Fri, Nov 14, 2025 at 08:57:45AM +0200, Daniel Baluta wrote:
>>>     This document describes the rpmsg bus and how to write rpmsg drivers.
>>> -  To learn how to add rpmsg support for new platforms, check out remoteproc.txt
>>> -  (also a resident of Documentation/).
>>> +  To learn how to add rpmsg support for new platforms, check out remoteproc.rst
>>> +  (also a resident of Documentation/driver-api).
>>
>> I think "also a resident of ..." can be dropped, since it's redundant (it's
>> already covered in remoteproc.rst cross-reference which transforms into
>> the link when you build the docs).
> 
> My point here is just to move the patches to a better location without
> any crucial modification.
> I can send a follow up patch if this is fine with everyone.

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara
