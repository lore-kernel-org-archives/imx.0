Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903E922318
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740056509; cv=none; b=meFhA4iz3kkZYiAr8kaJLkpXcD9d8AsW9lSUfTkMbDKjIfOBEreqeszlGDwvuwlFBA2HI/BU9h705DmOlKSQSssM4oYW+V6yZE6hO0yd2nneqpt9kv9Kcv5qeubBzX4XHMROmYiyKMH4bFuv73H1JIyisaU23ZhB+FdMZtoQ4GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740056509; c=relaxed/simple;
	bh=q4k6pLg6gFyqRkfKqGoGGD96uz6bTIidMfX2e2HpSNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hu9/B43UXYWuOuONxuUJDGb6ZkFGyapRHt3dkWYjU7p3mYjtP7vIn8SgZNNyY3EEW56889sWFXs4e3v2WFjNEWAzOtt6sNxuabpGwsvXnIV00w6gWV4f6j9OSQq5MTAMXGnGg7bmyPdxUmxoPoA6iJnInMyEMxonRqixRHWl8ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iff8p0YA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iff8p0YA"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abb81285d33so188139666b.0
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 05:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740056506; x=1740661306; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgmKYWvys2geNwIMlTB+AnD/uE/7UeYtcCFKBMM26oQ=;
        b=Iff8p0YAPACcSbTR0MtbfL+9mMb83U7/owQhNSlLYUtLgQ0KIjThIFYczWoQPmGCtL
         kn7LfAAqt8Hl10tL+uwmb6CTT1nmU+XyMZKFYElI6xsyRw9desw+KCyfwga0/HFhat65
         yGBxY50Rp3jqWfuWCtR3gXfovfFHcaCOA/CpU0MRfe1Oa8klkiu2qc9+2fIwFpbElQIy
         SGnC36HuWFNZwjlGe2UQcBCXJ5hcdxeDD3qrEI5IdXBt0cK1iw+6dBXQW/4mCnbvqI1l
         d5pTiVxN3Ygbn7QYbDOEq6zIYDGl6OGyHg8MdgVOCT4b1MJ1hp2j6xjlf4K++R1XNtNS
         17xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056506; x=1740661306;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgmKYWvys2geNwIMlTB+AnD/uE/7UeYtcCFKBMM26oQ=;
        b=pD6raXOSqS7Ct3BobUjX2rDMSTpRJCd+XJv201/89cEIlw+2yAlXSYq4ZZcK1Ssajv
         X/xY2Jk5R3ziE3Rv7U5cxGEE7m/W+epsm59fUXfLTuB42dk3Vq6uwoy9GHrQcniCAyzS
         Vz8g1JYHfeZ2sHqYPznkieoBj+1VA3HHPUF9sgHKXsOdgtj1EenvFF7RQFTBq2mQaMJy
         hu5RMftbSqe7SHplyvd2x0ui4PCE/COZUM0axPb5DLq8oo4HhIBIxt/ZwbForVow9SLg
         j7RqHSam27vDsOqT7zugxcl0Mz8haAcvrJdOoezbpPd6h480u+MgmygejwwJs1ZOU72V
         h9rw==
X-Forwarded-Encrypted: i=1; AJvYcCVwZYVXBCwjrrw1+a7ZOlR+gND15/FSalK2Uyxqre2Ek7FatV7PA0vpM2NvePkbr8nCSfE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ6Fw1+qqSaibiKUh35dl3Z8AE8dSc6qV4exhVBI+9vt1AgI7O
	De7LbT92qp7VQ2VRsv/JLcy1KJ029gSfLVBZuK0Ebf9txxyY6Wly
X-Gm-Gg: ASbGncviscr88I7oJgnB0QW232yQb1Wbm95F9vxaeFCT0wiAxYlFWUBqOXcOKt7kZ9K
	MxFyPSWutUyckRpz+i0w3ETlDFs5/z49qYhBTIP15o7HnlAXSJKnTlS+rEoJQl96ouqMqt6hvYX
	bIdXt+jXh1PeWzrUc90UhdTrOL8l2LM1uzmxUJe/NVrqqeGv50hgks5872Z/1l1NDYVnq3vFB6s
	H+kR3D5lXpfZbrie6P2R4ehljt+WDpKxLefWMA7Ti0MiU9hUKSmeQ62FdWnVmlzRZqM62/wwlAD
	CYydlWqp53KTeT+zuvtGzQ==
X-Google-Smtp-Source: AGHT+IEZIyZ80nx+CwGk+O93D4se/mLmew3Yfg4IU+0c2JK2d+v3wVGF39JlO4RSiqfD8//4VL8XHg==
X-Received: by 2002:a17:906:4fcc:b0:abb:de17:4a30 with SMTP id a640c23a62f3a-abbf384a4dcmr201647466b.19.1740056505371;
        Thu, 20 Feb 2025 05:01:45 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbbde95957sm492331366b.138.2025.02.20.05.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 05:01:44 -0800 (PST)
Message-ID: <c94580f0-3ab0-4a19-a996-9bb37e23dd39@gmail.com>
Date: Thu, 20 Feb 2025 15:01:41 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Umang Jain <umang.jain@ideasonboard.com>, =?UTF-8?Q?Pawe=C5=82_Anikiel?=
 <panikiel@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250220092036.6757-1-demonsingur@gmail.com>
 <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/20/25 1:38 PM, Jacopo Mondi wrote:
> Hi Cosmin
> 
> On Thu, Feb 20, 2025 at 11:20:32AM +0200, Cosmin Tanislav wrote:
>> Currently, the v4l2_subdev_state_xlate_streams() function is used
>> to translate streams from one pad to another.
>> This function takes the entire subdev state as argument, but only makes
>> use of the routing.
> 
> Correct, but is this a problem ?
> 

No, it's not a problem.

> Is this the first step for a larger rework or is this a drive-by
> beautification ?
> 

Mostly a drive-by beautification to avoid passing the whole state around
where we only need the routing. I'm planning to submit drivers for more
GMSL2/3 chips and we're using this just to not pass the whole state
around. I think I can just use v4l2_subdev_state_xlate_streams(),
but I had these patches in my tree and it would have been good to get
them upstream, in preparations for submitting the GMSL2/3 drivers.

> I'm asking because (and I know it's hard to strike a balance) this
> kind of changes tend to make back-porting a more painful, and if
> only justified by "it looks better" I would be a bit hesitant in
> taking them.
> 
> 
>>
>> Introduce a v4l2_subdev_routing_xlate_streams() function which can be
>> used without the entire subdev state, to avoid passing the entire state
>> around when not needed.
>>
>> Convert all usages of v4l2_subdev_state_xlate_streams() to
>> v4l2_subdev_routing_xlate_streams().
>>
>> Remove v4l2_subdev_state_xlate_streams().
>>
>> V2:
>>    * Fix description of parameters
>>
>> Cosmin Tanislav (3):
>>    media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
>>    media: use v4l2_subdev_routing_xlate_streams()
>>    media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
>>
>>   drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
>>   drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
>>   drivers/media/i2c/max96714.c                  | 16 ++++++-------
>>   drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
>>   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
>>   .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
>>   drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
>>   include/media/v4l2-subdev.h                   | 10 ++++----
>>   8 files changed, 53 insertions(+), 47 deletions(-)
>>
>> --
>> 2.48.1
>>
>>

