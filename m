Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0172DFA39
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755681885; cv=none; b=FvnIoMFIdSOiX4mnBlrfEfbycMrxXJTC99tpIsO4DukZrNoQtPQTefCECt5t774be1WjD1ZioWT/UMJeMDPckVZ9nztuedT4PvbczbJgFDm4rNunBGeC3eCu8iZtpzcSB3GJjnBRsMM3mftjn5EaHrGEUpa7gU+w2RuVs0H4b3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755681885; c=relaxed/simple;
	bh=YsfcxELiFOAmXJc5KTYiZD/18VbXLmuSDnLx9YMu14k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXw+/pfG9WuI2ZD6k9Ohe7MEz282jfGmehe0QkkJb0o5Q3x8mXcwals1B1HDRk/coP8pCvEO60O+25hL+Nb+KHrNM7QgteylK1WXYfHbiovNdiD8y+NNhy2v5aX+T9KDE8uNAVC1JIt12jDbTSWsnKJZ2QG1kV0+0SL9m9gySkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScKpqx/7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScKpqx/7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b098f43so38794805e9.2
        for <imx@lists.linux.dev>; Wed, 20 Aug 2025 02:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755681882; x=1756286682; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLt3gt1qsOBWGIq0JApuia3SpB74W9+IWd3Q2SbhflM=;
        b=ScKpqx/7hBN8XyByKTEZjTmtz6AMcmTe/i1WYVpt0+z4XykWwdVlD3CWnZh2XYJ9wJ
         kIALTRbZiaEBNyLHAybM7hfaxLhQ0Po1YadI6rrW+cO50Uv8vU8l8xcuhCkRJdIGPFK/
         oWW9ZFwcRoNtZtNDH0JTy6CM7XceJBRkFM1miJV1IorkS7ROkVD9wX7pj+FPwprSwIy0
         IjZR0j8hiXNjphhECXfeWhyIR9PEVDUUMN9GB4m7Tn5fz14F3/K95BLt/Y4YAnHjgJJC
         jW4MBsWL6L5akzg4ZW/qU4Pyf9bwsqS+LcFNVhVhaWI2tdd9wMBTmzFPUX5pWL9v0coc
         FMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755681882; x=1756286682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLt3gt1qsOBWGIq0JApuia3SpB74W9+IWd3Q2SbhflM=;
        b=YpYiWUhuPLJnLt0kq+JXQ/LK1aGi4HjS3wTsQvCyPUVcfTnP7ptR4b6ztMiZxH0GOe
         g7qRnUkstKm2CdqPh8mdnPNMRlA8cCfRTDErnXDGhgCQlDdvGtDq4vjvILd92U+1N6Zu
         wKJ25c89wqNbUbUDNKFcScoX8Nn4HGXZIbuxOWag29frTouiZrcDY4e27AxTb/6rJeYG
         /zqhvASnPf0muTiSDCbYgR4Qc2diOPTkJ6eJsgyrUGmmUDdKk1WQpBJH7U23y4IKgCER
         zJbaufq2e0l09GRxDFerkz2ZFJqOmnKAsbheQObZdP/0gk5i4w1Lsp5SUxVIOLDo+niW
         8vaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4E7wYCmsbFur2b+LDrfWMRobBnGvGB6sfQ3yZ54ElnCigc5LqspqyQVPwzxrQV0AAo64=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRZvio5tpItBdzY37oOOB1s3uO8jALRxRHdJijz+QyufnFaCZx
	5+YoPAHNe9bDKrowVls9ElNZI/PZ1p4MIJGRcP4pcya9ZK6G3x+fpyrk
X-Gm-Gg: ASbGncsYGE56oyStouTSc0iOUURi3Sut9j+gQ/E/VugchOHx6Mzy26tNQFNYNbRFWaI
	btJ+IPq1Kg3+f5uFPk1hVazvu8FOd+Iu2I6p011n/BZrWsa2ANfAshLTkoBJlCNnn9g/DKomGk7
	UXIivVZLq8usARlFkqFFJcGUhJINC0TieSfL8927JGsGN5DFnjuIMfbCzHt3SiiTMZpzp+QRrmn
	ii/W0W+aYvtsgJ7sGusABnNXHRK6ax1N92RoP0UtFzYQwuRVb2Zw/pCqgv0DzHLxa5UVlAMCV5r
	a5xV9CWtw8N7CG6jPXLIxnMOQfU+NwnZU60iKwgxiTAPqWeEjE97kUCtwte67HAPSDa4ZBWXDR6
	HS4ChCmOjQk9qWN3I1Z8qJEaf5rXtgLVRRRFFk3G6c34Vv7yP75rNiQ==
X-Google-Smtp-Source: AGHT+IEdVvSfP6hR5d/NgsKUNuBQLvsUVo4gp5lpQ1tZqbTBQDyAyiU5nZrefErtKOVZia6oMgAdHg==
X-Received: by 2002:a05:600c:4706:b0:456:27a4:50ac with SMTP id 5b1f17b1804b1-45b479f3499mr16501435e9.23.1755681882203;
        Wed, 20 Aug 2025 02:24:42 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c8e98dsm25578115e9.14.2025.08.20.02.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 02:24:41 -0700 (PDT)
Message-ID: <00984350-97d2-4aaf-96c3-091f15ec1254@gmail.com>
Date: Wed, 20 Aug 2025 12:24:40 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: imx: Remove the use of dev_err_probe()
To: Daniel Baluta <daniel.baluta@gmail.com>,
 Xichao Zhao <zhao.xichao@vivo.com>,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.dev, kernel@pengutronix.de, festevam@gmail.com,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250819112654.588527-1-zhao.xichao@vivo.com>
 <CAEnQRZB=fq7=ahMkFWaQ58SR_yftSTYqZKFBh7YEXz2M7PyXsQ@mail.gmail.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <CAEnQRZB=fq7=ahMkFWaQ58SR_yftSTYqZKFBh7YEXz2M7PyXsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 8/20/2025 10:04 AM, Daniel Baluta wrote:
> On Tue, Aug 19, 2025 at 2:29 PM Xichao Zhao <zhao.xichao@vivo.com> wrote:
>> The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
>> Therefore, remove the useless call to dev_err_probe(), and just
>> return the value instead.
>>
>> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> NACK on this.
>
> Quote from dev_err_probe documentation:
>
> ```
>  Using this helper in your probe function is totally fine even if @err
>  * is known to never be -EPROBE_DEFER.
>  * The benefit compared to a normal dev_err() is the standardized format
>  * of the error code, which is emitted symbolically (i.e. you get "EAGAIN"
>  * instead of "-35"), and having the error code returned allows more
>  * compact error paths.
> ```


AFAIK the kernel logs are verbose enough on OOM errors, which makes prints

such as the ones removed by this series unneeded (have a look at [1]). Normally,

you'd get a warning from checkpatch but I think these logs slipped through the

cracks because the error messages do not quite match the expected format?


[1]: https://lkml.org/lkml/2014/6/10/382

