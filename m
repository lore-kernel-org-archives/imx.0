Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1F521D00A
	for <imx@lists.linux.dev>; Wed,  6 Aug 2025 08:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754467399; cv=none; b=KCUtVVAxk0QW78UJHsmWcwYkJdd/PUZp2r7C+Nfmj9Gf1yXIJWo3kvPwu1bbMLPZ/+7+lSibyZZDEFltkQQpH6vfhp668rmG/8hUc7e0Yu/v7dAreISoV3ZCYzofdJb39MC4T6aXRdYg/Lx9GC0DkzjjbOrQj6Cn8xFyg85N1xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754467399; c=relaxed/simple;
	bh=mxwhW/LgIW3LqcR+Fr+P20a30aa6bLS3i9JEuWlpNNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnmdX7VZ9bbuF6vwZa4KqFag/fSKuhF1H2VkkCa9mTzo4dANmjc4jlI0jd2TOTInoGWfz/9SzUaR6gBxG2cjHoYVewVbwLKY1i6fYOLpG4yFD3uJlOZBcoMxXrDnXuQ2bAdC/DyMsDbuyTqhYnP1EGFB9Sby3Gsog/DOnVj4zyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SP6LaDjb; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SP6LaDjb"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23636167afeso46013365ad.3
        for <imx@lists.linux.dev>; Wed, 06 Aug 2025 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754467394; x=1755072194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxwhW/LgIW3LqcR+Fr+P20a30aa6bLS3i9JEuWlpNNM=;
        b=SP6LaDjbkTyRe209xV8J2PF/k5SWyw8gu96GdCmufPKQXtIXgDOHRPf++iMP8wAWcN
         nWRJbGH6WWZVcFXjPBqw2wijsnqMSTAAXWIC9pAj86SFyns8CDM2Ynu3/pcwCCPIlskg
         OHN92h1P03C2/Q7y44+YKndtYye8lSE0pMJWNryRBEejx+fl1IEQGv9iw8cTF1LvPByK
         EOQ35H6yRLeH+Nig8KNmaBQu2WTfD0kP4086ymfQtKXn3IbAmWvs4MGMuKBZlFj9gxdL
         0zfGqmfIShv+A0ewxG/tfj1K9wT0oRP+xcRarBoT9GXZQmajz9zWEZmmYUSUeX8a50ti
         PtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754467394; x=1755072194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxwhW/LgIW3LqcR+Fr+P20a30aa6bLS3i9JEuWlpNNM=;
        b=r+owaTandloTnCESnRh7SUBU5yYt2WvDvDPeltuEnvReafLyiwz1nrpYeBzkotnVDY
         Q1fit8AkaSuW56yfzwqXNBuVYtvQL3cmyR47iHwvPunrbWIqYim2Y/HDltj4bi3bAaQr
         rtN1CpuRWrbi0dalMmxuP0RT0IX4S8HWOOR88Ii+IlXq4B3/knVzwBajgbVso14y7Jpz
         ln7vEKJGAvB2wuPWa23C+sD3lHag/K76gr2dVMa94CP+AGBsBOYFwASeDZfOE7/jpJW6
         87zQmfMJou0RZNFujO6rAvMtNmOj3sZR0oh7c2rvJBJU26j6COvVAM8nMetR7BIyfWf4
         qY+A==
X-Forwarded-Encrypted: i=1; AJvYcCVeQVS/I+he4I001m4JmE24cb2RO0V81FR4uuKT4fotrcuUCsKkzYF18P3uuW0DP6hWHLM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAJbqkR8yl/idtzGhepKue+AFKw8/RApREmQTTw0HBqEb93qUA
	UGXdaMTXSvhedO2X7kMIpjVGGoioZgNTzcyGUUHjX39Kwj72GiXbBoCa2Q2nktAbPg9AH8Qvgqe
	MxCBL92ZMMFBWjzGpobbeJzLJ6RnB6oo=
X-Gm-Gg: ASbGncvmkUrnLhN3TGJyIk9+Q7kkSRnX+sFftxeot+pJHDv5xbFKwPSBCn6dsZPsW/5
	Nwlgc68GijKweLifHNM0yz1nAgmSZFZPAveet2vIA7C8flIkNeVq0wqTV/yaP6/wBvD2LYOIwz8
	ORAUmTwanGeSGieYxqoW176mJ2gM5NC+ip9QpIOCp8HEouBQXuI6nMEZTG9L53FCsSeh89pgIWM
	qoO
X-Google-Smtp-Source: AGHT+IGN/epxF1k5Rei1FpC/BRWg+FClZI6Re5L8Wi9/3SOxZcU722vABqtiu3JL1q5hOj1GSrOTay1RynD3blfSsQ0=
X-Received: by 2002:a17:902:ccc3:b0:23f:f983:5ca1 with SMTP id
 d9443c01a7336-242a0ae476bmr22183395ad.12.1754467393754; Wed, 06 Aug 2025
 01:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <pndpldam7tf.a.out@axis.com>
In-Reply-To: <pndpldam7tf.a.out@axis.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 6 Aug 2025 11:05:18 +0300
X-Gm-Features: Ac12FXxwVAvTH8GuNuBL-sO0VmVAVyE57Kp1iye_BVOcxHVgrYKsjiw7CFUOjY0
Message-ID: <CAEnQRZBpG2gVGG3Tp6yLcueNFw7R+KKLhjOmwRa9j8rw4QRuvg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: SOF: imx: Remove error print for devm_add_action_or_reset()
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, kernel@axis.com, sound-open-firmware@alsa-project.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 12:33=E2=80=AFPM Waqar Hameed <waqar.hameed@axis.com=
> wrote:
>
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
>
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
