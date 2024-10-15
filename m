Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCA91D63CE
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 22:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729032308; cv=none; b=nmwDoT3ZEXjt4XhJTkhhX7kU/sdA7WQrpFrqk2SM4b/2kFMI5GAqHSev+taATAV6dxqFG+fugr+rXCWevYqhqqJFF52KCl4+wE7o1VE6vHGzkL6fMl0gXjNi7wIqeEVs61nCg4FmzntAzfGjHJHjaOWltPTA8Yc1mHObixSe8J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729032308; c=relaxed/simple;
	bh=DsdgpSpoWZhnIXCFppOJBlx0EyQB6WqayryDSQ4A8CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXb4Ntfd7TH0ZXUAOl9CJHR8n3SUkoT5UQThehAAVpd1Hdw8a7Qe2kiASMCHn8Hvzae7ypEmXrChhz1LwR3B5W7Fsuq7ziUChQTJy7XCAMw6HO1x7PKBl0OEHmLQOpiwROz82edy/lGHAwiasLvzcu/LGHE3kvuP3CA62nt3mt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bje5hP2q; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bje5hP2q"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a99f646ff1bso504521366b.2
        for <imx@lists.linux.dev>; Tue, 15 Oct 2024 15:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729032304; x=1729637104; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wu5LGapJAR3TxlLLRLI6uB8Zy6lgYfJ63+ETUjJg8y0=;
        b=bje5hP2qN/cM4WO/g7bVc11HcjFRSPkk/C3nzlO9EBOi/pJdmhTyUI+Ys5IKg9RCuZ
         bzD21muF3cV2JzNDlTvaz8MCIBA98GIk5DSuOPRZ+/FkohnPob2Oey5PbUh8SyfDRau2
         3tjhEiMBIyUXNQ0o2xbECxvLLVEI349iAgY3+FfY2YXoVEsjlLWWiIRwxAJvnlFxJUAf
         zFLKMWtIhlGCmz82U5Pl/xNj5pe0Vee+nxBYyg1X7kk1KeaernwYHJl7leKNcY90pUdA
         LvHjvhvJ/epJtUyKm+hJ2kdbnDojr8AmlgliKGWWq98lRiHzlx0RnE65RtY7/lkW2AcJ
         7tfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729032304; x=1729637104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wu5LGapJAR3TxlLLRLI6uB8Zy6lgYfJ63+ETUjJg8y0=;
        b=fukdRKWkwBSp/fUA0Fq0kXRQa2j+Daxd7frNQ6x/s6+XSlXfWBlYH/qJtuHu3lz9UI
         kSYiehShZDnxIO/2XBBq1SN8IzRqcWbyWxuOR0ggp1xqQl0Jm+AlLLDuydHoPOibBnhS
         aPuYiU4CG4acx+VG9c+0036EbQCGoPE0OKTtq7BKQ94kHpL2suq9JcydyoSnKdBa6YT5
         UwyHdgAZL3RRxkNg3MT2OoaK+4/t5+L1kiJ2RCb+oDLm5j/O9t4ZEKPZACBjAoK8MXD5
         lP1dWd+wOt6zAFZ8ysfazeiMmjGd21rZ0Tqt8ZLFlkyisLXXQaQEOFVHURNCEaUyC3lj
         RkKA==
X-Forwarded-Encrypted: i=1; AJvYcCWvUuRyRZSfGyid4HuFXl4d2nTuPIq3FKsupUHXAx0ycy12mnRNLbNoG0/ntaGjA7L9r/4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPtd11dWTqXCJVPJbSBS6SXQr7g36YZQnf86sxfV/h3eI25pHK
	gSHTnty1xNoAH2sOhE8S9jeLDpqUB89vd76knq8oUWqofrrJpiDVzM0vKpQO7XQ=
X-Google-Smtp-Source: AGHT+IE8dkYYRG4VSiuIYPilluzQgGDtk3E35fxzuB+y4xhvcllblu00zCcB/RT5fExPyYiJMsZDuA==
X-Received: by 2002:a17:907:7ba8:b0:a9a:1b32:5aa8 with SMTP id a640c23a62f3a-a9a1b325dc9mr609885166b.4.1729032304410;
        Tue, 15 Oct 2024 15:45:04 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2988c63csm114946366b.207.2024.10.15.15.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 15:45:04 -0700 (PDT)
Message-ID: <1efe72f0-6777-4057-8c5d-47e891ae1b0d@linaro.org>
Date: Tue, 15 Oct 2024 23:45:02 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
To: Rob Herring <robh@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Todor Tomov <todor.too@gmail.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
 <7ecxjoa7aije46cxmkyfd6ihxnqw4wleqkioddomxbwlu7qtrc@4dkfitppeksu>
 <6f461cb3-3a41-4a3d-b9b2-71b1c6be77f7@linaro.org>
 <9510b546-28fa-4fb4-b06e-0af5f9fd3bbb@kernel.org>
 <20241014202920.GE5522@pendragon.ideasonboard.com>
 <f265576c-7d83-40cb-b857-7ec54ef9ab46@kernel.org>
 <20241015112806.GA2712@pendragon.ideasonboard.com>
 <20241015194418.GA1244454-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241015194418.GA1244454-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2024 20:44, Rob Herring wrote:
> On Tue, Oct 15, 2024 at 02:28:06PM +0300, Laurent Pinchart wrote:
>> Hi Krzysztof,
>>
>> On Tue, Oct 15, 2024 at 08:11:18AM +0200, Krzysztof Kozlowski wrote:
>>> On 14/10/2024 22:29, Laurent Pinchart wrote:
>>>> On Mon, Oct 14, 2024 at 10:47:31AM +0200, Krzysztof Kozlowski wrote:
>>>>> On 14/10/2024 10:31, Bryan O'Donoghue wrote:
>>>>>> On 14/10/2024 08:45, Krzysztof Kozlowski wrote:
>>>>>>> I do not understand the reasoning behind this change at all. I don't
>>>>>>> think DT maintainers ever suggested it (in fact, rather opposite:
>>>>>>> suggested using unevaluatedProps) and I think is not a consensus of any
>>>>>>> talks.
>>>>>>
>>>>>> No there is not but then, how do you give consistent feedback except
>>>>>> proposing something to be a baseline.
>>>>>>
>>>>>> On the one hand you have upstream additionalProperties: false and
>>>>>> unevaluatedProperites: false - it'd be better to have a consistent
>>>>>> message on which is to be used.
> 
> There are 3 options:
> 
> - no $ref => additionalProperties

I interpret this to mean that omitting 
additionalProperties/unevaluatedProperties is logically the same as 
having additionalProperties as you will then need to list the properties 
explicitly.

> - has a $ref:
>      - additionalProperties and list ref-ed properties
>      - unevaluatedProperties and don't list ref-ed properties
> 
> I do debate (with myself) that that is too complicated as many don't
> understand the difference. 


We could go back to always using
> additionalProperties which is what we had before unevaluatedProperties
> was added. The other option is always use unevaluatedProperties. 2
> things have stopped me from going that route. I don't care to fix
> 'additionalProperties' treewide which would be necessary to implement a
> meta-schema or check that unevaluatedProperties is used. It's not
> something I want to manually check in reviews. The other reason is just
> to not change what the rules are again.

Right so I received feedback to change link-frequencies if I recall. I 
thought I had been very-clever (tm) by copying an upstream source and 
when I received feedback to change assumed the upstream source I had 
copied had bit-rot w/r/t the current preferred way.

Some additional discussion shows there really isn't a preferred way at 
present.

Is there a place to meaningfully document that conclusion instead both 
for reviewers and implementers ?

Should I already know the answer to that question ?

---
bod
