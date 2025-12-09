Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF3D2D837E
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283628; cv=none; b=OSZ/NxdjyP60Fs8gunC2sXDxLC5TAFUMPDe+kZ0ekvqGXYkFzJFh/kUXCsHQmq4Rn+N5WTNKJidQfZPxcofkCa+TVSApnShE4DifeV7kAWL54OqyT2T1INQD1FhJomq3tHKNmOOrhD23xzWvIQPPq+dj/5ehyN+NZgb6ugy6GuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283628; c=relaxed/simple;
	bh=bVfvPAVJiKDUO/oAofy3yqLD+wUWwuI5iU1iNTYY+WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tq2HgysD/ZXSiAVlns6t2fSDAwzKjBRq4urGxBU6/6awvxP+sivWdl1qub6nTMCYU626YtwWblNcrX/AAlLl2h2azZf9EwVhTFDRoDm7vj5B1+/vqJP/NYmt/y4JIG6PIOCwScCRwb05R7lTJh1AXEUcVvrlCH1vBH0u6laHP1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRFZsyHp; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRFZsyHp"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34372216275so5636809a91.2
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 04:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765283626; x=1765888426; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVfvPAVJiKDUO/oAofy3yqLD+wUWwuI5iU1iNTYY+WI=;
        b=QRFZsyHp7buVutB37RXvwPR/8W0DCNS+g66J7iW320X/Lqo8xuvi+1UfRGxYq3RGI5
         B+O2rRQys7BJ67IFox4rNIfajuLuw8AMXKr4WRk2cfWaFaMjGels0LGiVUjE72tauIFw
         wNZVJ7Ecu1NHEM0CoUoUSCTRkdJwA+2mQG8ND+v6MNslsVeUXdWCi6N94MwZSTUPOnCR
         zBcp5+MXx/najG9A7eLWOF4jr03PPzNwm6MhGaJw0DDWEiQr6tiYUXu/m6XOAXeBGveu
         7a+qBO1iAEv5MAlfbDo4G7HVXzrpyW5BBkNMDliQWjlm3icaxcgeDYRccSWWhA7+ctbj
         PheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283626; x=1765888426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bVfvPAVJiKDUO/oAofy3yqLD+wUWwuI5iU1iNTYY+WI=;
        b=OmRhNFwY43UMaUdNvzRbL/Fks9jzd0gjfgMdaBGl1dnuDGfait/v5tjRYpwApcbT6V
         +ZXPJW/RiLC3Zi9Rb3VSfKzpBCfXW1vkw2198ic1Nj6VI1HdxRKgNOg6Sbjzl6E5jhjG
         itqjSAfsGOwv2VO6zsn0hJfNjMqz6aBeIXr3IcYSHEaZjhmMV9L/eS4c1HmcA0nmaNij
         Wj0qOUhFSrkizHcIxtVekfcClYvCWMg4zFTVkJCxqFPH+IkledrHQZwO/UoDgEploIeK
         csukLJRN5hJqQ8SSrwpkbxEyws0Ls9CbiGPBPliYEW89tPJ9us6Bhekin+BvFSXzTj1A
         IywQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZJu4c+LKS9qF8Pi+C0VbXStIOPVwc0LHT2iIlpfuWPaa8XptHVq+HT7dqqPLFr1YqOJk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzraHMZNMrcfA+dVyO8Ll76I69DBuucwx4iCqMbUtlYLcvegfoJ
	ib1rzizsvUb9SZ2sT05wK7m2vLAcVbFIb39w1mvOmWW/HDjbiO+gAuZWwIZ8KgHNNGyTLM6p86g
	GcdfMwUOQQeh31CjFB06JueT0BoJDAS8=
X-Gm-Gg: ASbGncubKfwZujW+Gfc4INCq135HpdJXsz4QK6wi52gyLVv1nwVnlpTIqemobUzfNlE
	MSv6UeRrwoFDBsfs94MEZpT9l51zrcfvufC5sOotMscXTTF9vdEUY/GWOcZulQR2x9osjNzoejf
	w5qybNzahYE8NA9TkigW5yBZ+7LLGSiW84Wv1zZRLNtOXQUJHk28aQ87+M1qszHlg7379njPTdx
	S9JSixVm86t2t4LKg7IqBz4QGxhh3IRQdJacr6vntdusKNLCqYV5nyB2nnfVJ0vCOPf3GTOpKuz
	bM3VTmapT/DCpQ3dh863JyuYv7R6gMaFszM1m6DxGY5qcIX0D09XTjxqra3N1Ary72U0HrqKXId
	RRp4w7ZgBKpMhfS+eggdt
X-Google-Smtp-Source: AGHT+IG7a3swFOeoavHL3eVOxyU5R1CfS1RV/ynqUg2AU4818nOaE1Wsmd3U72SU9rWnp62z0sQPFfouzT4ajqcYuug=
X-Received: by 2002:a05:7023:b04:b0:11b:79f1:850 with SMTP id
 a92af1059eb24-11e0326a26cmr8705323c88.14.1765283626541; Tue, 09 Dec 2025
 04:33:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 14:36:15 +0200
X-Gm-Features: AQt7F2r__yxV-yD2aXnM4sB7qPP_1HD4VqjjT-S7yknrdE9jP-LkBjBwD7RtsF0
Message-ID: <CAEnQRZB5_WngP+U0nVdW0dnopUD5YDtZEU91StywvNTQdNSPNA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table" check
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 1:33=E2=80=AFAM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
>
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Good catch.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
