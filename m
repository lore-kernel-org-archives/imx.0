Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C5A48F02F
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 06:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056956; cv=none; b=VpboVnvmlKiPCxwayJ8He/jTqNcwrO1ocZGtYo9Ykd1vVKNlU2Gy0ZzMKuzFInY5moM/Sl0JRT14IwcAtzTfKiNQLeF+0A9kc83aehaHvRp2/Ek5D9Yb/hI4wvrWMWNZ2G9Gog7HD1e4yC1ESUDlNUmxH6FxQj58PAQ5q+p2rtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056956; c=relaxed/simple;
	bh=UTGrp+lZOAxLFmkLKsLGysXMTNUwZ9BjO56kp90DTuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfIrVPo6EI0JPFrr4kDLEBI9Bc5NNrey4L8i0gGFW6yXOgHFRxbOIZOPDtvPKniUrpeMMVfiaqIb2tdRDc5wGnYHk+PhXrHVk1H4ynhemNqMOyQYOlqnwl95TzhwEG9iidb6PpdJOV4oQyIFwZFLIDdo7N13IoVDuWZ5WQHOxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/glr1/a; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/glr1/a"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a02551822eso634018a91.1
        for <imx@lists.linux.dev>; Mon, 21 Sep 2026 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056953; x=1790661753; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQ3bgQN5Dp8+Qvmy62hDVi5O4cZCEw7wjVOCUUXKBjk=;
        b=C/glr1/atbUj8gyxNNtBW51pFZFwt6FlTSUix1Ynao3INFEVAoGCMD/oIx+XlPV1fJ
         S3hx6+IfMiXikhamvsDiVFDHi0fWOPEjYli2DSa4C64CtHFpAbqOE20vLHzam6RmYRcJ
         s5BvN4hbC16FQkQU7ek60jXT8K+vuKMlbNr//zjiVLQKTC6JgUlrSFmF9z6mUQzrdSeQ
         lEzuYR2FsxBcm6x4+sbUM8hfjC6DNt4I4zgTKuRSMELne282jAMOAAO0jZQr6xIX3UX1
         KDV1yMn/Ck1OJDVjI4ZKtKWx3UUEhpK3VosHNW0qPV54uOJbEptwBVivsY5plldtl5C7
         0ybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056953; x=1790661753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQ3bgQN5Dp8+Qvmy62hDVi5O4cZCEw7wjVOCUUXKBjk=;
        b=meGdtLZcDnsQ0ikc0DG6uqSzEsCfu/FBnmHEFkzCU5bnNSVYCWdG3VwxeEJUrVQVaU
         YwN12q+enBp5zcL+3lg4wRA4BuctZgbXPxUn5exixviutV98VrZc9BvVTbfmHpnjNVKv
         19DopUfO1KJtzkicGLTiBUuXfETpDcwLh+gQYP7eKXO9aPngoJLlnlJz6hqwztadRWLa
         68CIO0BfXoE8vzI4Kkzdnj9d4FPOoiLZiiqOvsD+nkm6bA9Cnmzh76TGYO7Q599hR0rW
         w92pP8wC+fDHG1eGiH/3qf4RwzY554mC1tCm1OiuSL33kuc2UmZeXFmIZCOClG7LH7mQ
         toag==
X-Forwarded-Encrypted: i=1; AKwUvBwBvb405X6EXutO/Y34Rv4CnQ4ZqKXBCc18dcaQMYSeUOentIifC0kgwA1hJGu7QklRMvk=@lists.linux.dev
X-Gm-Message-State: AFuF++l8tweJPh4GxTjZgNgnaGu1WOW2DGV12GX64Q/M9jfBw1SK3gyX
	LFlZRvGh85aY9m2+4lgjQ9wHAS+WY6NRj+uvPoP41eBR4kW1eEYN/5RL
X-Gm-Gg: AYBFou33NtXu7WlQUdLpzMAwvpN1nbCLkmh988pMLATTS2NvWLZPoqaUDg+yWbrOJfB
	77sWAevDzVUicICxLJzv9wi5HMY/o7nbgHVB+B9+9yPc6t87xgjHprHw4vc/N6rQhdaZZvvtY/0
	GPWNsgihmfAAOv6qcjdYOqBRJcXNuJeDPNYXd2oqEcd/isI3XmFmFkfPTodCL4wyzTvnnF8TtJX
	FWXV06fEUeuZnBbB9RuMbRd89n+Ib5Pt9sO9dCJVwcSocW6BEkoIonBAR2nltoC+kZvJpdNof3/
	vwykq4tYnmf4Ya3BkYpaUyDEm2DZ6RAGQdZg+x1PtwzNsv2YodZ8eeCR1iHzIWXeQ2C6/Fj+hfH
	dUmsRtMHgFKDIT0dv6pQIjY+LjzY9XJmsk2vsg5si/LKYn5iyn6Rt0fOWMjnbFbNd0fuRYugUPu
	8RrcbFyd7chjChZajyWwKqBMxD31ytH2oJC1DjuYCch3mrmBb/jKihNsSV65yb05fSB6iX2hW8+
	NuJYta2LQeMMERD2XY=
X-Received: by 2002:a17:90b:3fcc:b0:39d:e78d:32d2 with SMTP id 98e67ed59e1d1-3a0730cbed4mr111836a91.13.1790056953102;
        Mon, 21 Sep 2026 23:02:33 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61340e56sm3366245eec.30.2026.09.21.23.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:02:32 -0700 (PDT)
Message-ID: <976f828a-bf48-4788-adb1-7204c27dda60@gmail.com>
Date: Tue, 22 Sep 2026 14:02:24 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 5/5] ASoC: fsl_easrc: expose individual DAIs per
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
 <20260922033428.1690822-6-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922033428.1690822-6-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 11:34 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX EASRC hardware supports four independent conversion contexts
> (A, B, C, D). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_easrc_dai instance with an array of four DAI
> drivers to allow up to four independent conversion paths to be active
> at the same time:
> 
>   easrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
>   easrc-1 -- ASRC1-Playback / ASRC1-Capture
>   easrc-2 -- ASRC2-Playback / ASRC2-Capture
>   easrc-3 -- ASRC3-Playback / ASRC3-Capture
> 
> easrc-0 retains the original generic stream names to preserve backward
> compatibility with existing machine drivers and board configurations.
> Each DAI retains the same channel, rate and format capabilities as the
> original, including IEC958 subframe support on the capture side. Update
> the devm_snd_soc_register_component() call to register all four DAIs.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

