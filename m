Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1051DC198
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 06:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056918; cv=none; b=uoao/mdygZQJGqzdxYJZ32aY2ysWB85JPN/h/+YiTSWU6MddjbxaTu918kySt1wc+N1BY0fECqRXnZ9TMpBPo192lhI785tHjuwtuU3MBQuljNtBjf9efPnqufSbD2Tbmm3Ua+ygfENrRPMnl9Ms2gzCxodhbwUCJvoQjSn0Puc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056918; c=relaxed/simple;
	bh=sDdKrJmvs5QWB2mO+IddhtMXz6qcKGamXBsMMe9RzFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oy7M5jBo1+NkyfzVrHhqz+8Xkb8bwFoVgcaaV1Kx1n3lDWh0BB9JzF8HHh5KvPYQ6DqqjcpxN7gOgjLhxSYSO1mPu9stYEzMfHu5bGc8MQRdqur/L5Hx8yEo56JMVqnrwZ8y+XjMOrksuMWkLS9vM1XznkKH3JVwgiEuhq2SV0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKKARMv+; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKKARMv+"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so3628846a91.1
        for <imx@lists.linux.dev>; Mon, 21 Sep 2026 23:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056915; x=1790661715; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37Eexq0zFYxGYgBaFUWATikMtDj/TkGR7YrZ6T7c8q8=;
        b=iKKARMv+kCRLyOIhA8lI9Gs04tGAGBTltuFY+QmhaoDJp3p5Pp/nLbW6haHXQfnrMc
         Ff7XKFUoNRpeiStf7575sci4OL+m8CClM7Z5mwIucWKDCIBPHQ5o3Nkzvr5W8yItRckG
         Cdjh7olGFCmdvHAneqevwjq045WIzkzrULHP+1KOayiueyB1UA9tizngxFyiogDMabA6
         9N+zsAA5G6EbhxqfwPFsyMG92i3BBIwhhvhN5O52zzBS1l7y3zAMeFPV+oICa8fCkD4b
         kjvQ/7sJstKkQaTpu/ZzUX/KFD4qEKzFhiYaQWIlEcmBqO+9XBSVJIXag+EgB6u6SkX3
         hwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056915; x=1790661715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Eexq0zFYxGYgBaFUWATikMtDj/TkGR7YrZ6T7c8q8=;
        b=Ec8Se5REMJSR6G8BBVnVXY4+Ils1T1kLr67fZyzp+6jBJs/xKj7Fy73Ggt1onvGiUg
         PzxauWVA37tiQvHkguyUCs+DtaXPjaOubPnXxg37ED5rI+6qapm1enJ5JqprOuhaTZnW
         oiGIkK6vVb5QOzO/Fv34YHXM/6d6xCgNTJD7AWKIFSV5eY0VAvDAtsMvs9/GcyLRaanp
         5eSkFx4hecktkbPahoWYWlcKG7/MhuCEiAM45jLUGVwkFlNVk9UcmND2kdU7L1/fn6HW
         VQf0kfLL+VuZCn2NzWeaEUYcp7RSkXWv7kKmURc2L8qP/KlfsXuv2iyJLbQfGzDhmDOI
         sNJw==
X-Forwarded-Encrypted: i=1; AKwUvBztquM9gUl7GcQNY4l5X2ORm868gcQ8UZd6BarL/vOqKCZsc+H+KtV2d++fmcU4JVL0L2A=@lists.linux.dev
X-Gm-Message-State: AFuF++lv1MGvakmQ/1rdqnvQ6SBUYeYXGTX+rPWa5VWv2fvARpmwHezC
	Zm80x9fO+3Rm3jTuK2q8KiBGKmWZ7t0yaXZd5aOoAQ9U1YSDTYtd3yRi
X-Gm-Gg: AYBFou0jWdSNacjGX8QRNLfgLbhEf/Vop8eo2+ULV5CfEU2ndBjyWx2kObmOvE8Jifm
	TPhY/dzW5eMlM2Lbu6YQiRT1kxRRzfJOn5OgtfTfmvDECqMBFILMPEfl8qLAVHFtAPFbjIGMzbE
	P48Yn+WYTy1DFwGae+4mPEeEdeyqmkPws6Gcdyj0OfygnQXgP8B/9CbzvPx/KD2z0UkeFEwSNUo
	Gu0le62zz/pFwk8vCJDmYuGyUw10QWbQj72jN5SurOihJiiQpSnaOhl2WfYeystRbs3sicVlJ6D
	ljVyGbauHDYYeUycsNMSkzfbVBDf7xDhR7/2FEcEccViYm2skwLISNzkkPnENC5zU0QpdAyLtWn
	kSTqxNmcdE4qyUg8JxNQIrxr/4vOLIAEASu6p+crt2ce4SXH4tN1sMfHqCfR1gMrXxcV7EaRKQz
	7dJk/WKE7fvj8Dg6IEqOhIhSQa09T9NrbflvjYM6qbTCWKOD344xLZ6ontkGrwrtGNUSZ6BMZI5
	jOkNFFycGeX+2FeHu0=
X-Received: by 2002:a17:90b:558d:b0:39e:1ec8:ee7b with SMTP id 98e67ed59e1d1-3a07309f897mr123698a91.7.1790056915456;
        Mon, 21 Sep 2026 23:01:55 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e8439sm2788903eec.3.2026.09.21.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:01:54 -0700 (PDT)
Message-ID: <878dc90c-3a4c-45fb-bfbb-2ba802bfc14c@gmail.com>
Date: Tue, 22 Sep 2026 14:01:46 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
To: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
 <20260922033428.1690822-5-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922033428.1690822-5-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 11:34 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX ASRC hardware supports three independent conversion pairs
> (A, B, C). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_asrc_dai instance with an array of three DAI
> drivers to allow up to three independent conversion paths to be active
> at the same time:
> 
>   asrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
>   asrc-1 -- ASRC1-Playback / ASRC1-Capture
>   asrc-2 -- ASRC2-Playback / ASRC2-Capture
> 
> asrc-0 retains the original generic stream names to preserve backward
> compatibility with existing machine drivers and board configurations.
> Each DAI retains the same channel, rate and format capabilities as the
> original. Update the devm_snd_soc_register_component() call to register
> all three DAIs.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

