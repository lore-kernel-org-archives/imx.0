Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794534507;
	b=hHJQhpEIIUk/JN6kbv97gXsdWyoBhATZSsduX/915QsnrGVLL8lZGSfSVj/CnSCQVhaQ
	 8Q7eT5U1nvGhWCAa/oeqPR24uQSBYZv2Uc7LkkfNW8gEu6bNmbHF/GMDcGhwRT4VQi0zY
	 YRXB6vkMXnbCVc2/jmRby8mcrR3udT1sU7/sUJUgBeYcaYcTtwXRkK1PS6GF79NxJO6fL
	 DPqv9pdXvI2Z3g5fh02GWLg6DFMCIIJZBRkPFSaX6A1HlQLHoHNKz1XGAmJF0nNNW3c9x
	 fQlEKuVE+LrlDwh+OG3Sz5GmEUwdZdlO7QfZ5m2g9FBOnEdRnXkvn7FSrLgxaHg5PVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
	b=to3yv7LEmG9TtX76VSiOTrE3yqRm/pDfSTkvaaD5/cb4fA7RGYwMs/qCS+mmDsaVVwSl
	 /CEOSLi3jyIRSn8FTuX2T1I4xKTEIKL1assEX1A6QioLhHlK+wDUC0TCZHIBLYbu+vWo4
	 3qyAKCHwZXFrAFYVM5cIlZukmNJIPuyFFe90tWUbqa5YqhuV8gITpeVVxpLay8utHMFUG
	 eWqt77XbqodvKrXLqln6f8nETWJme/e8wNouRqgFJvNSHO8x18HLef0lyrtbjpB7z5jjY
	 4HvdXWlPQAZmN/WYn+ZDgEcXuLXbZUBfXrpXzuO5jCJj2XJHUQsg922c1aGFONrU0YA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bIJNZ3QE;
	arc=fail smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD79606A31C
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 01:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bIJNZ3QE
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso672396e87.3
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 17:48:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794534505; cv=none;
        d=google.com; s=arc-20260327;
        b=UlnDRBzxRnEY0Xuf1XInEXQeBgkf+L2YPWg+7uFCoYW2lnR/38fjIP6wghQ9ykUe/2
         VKunaJ6xJ4krle4cYBXP/dRcD83BMnSShs8eVVVVXL+4p892LMt/DWLaPDg/FzJGhybG
         YcXEWIwWMvcfCgiRLUDSy8iCoCRcqleuDjsYVq2fCRxuVgqgLWRNf7rdWHFebsONWQgv
         wpGjPOkbDF90b35GaBAB3R38zl4fzC1E4x1pFnTVQe+2gfTElpIsmVC0uCukPEaWH5I6
         e44f6LhKdbhPBxlsxxP/u/NRULH2PIaPiehLFlqamIoHbKAcx0eeE7piqaktbvVtSgsL
         skAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        fh=kgsOfAbpv/39fT7HtrBg9ejqYTkZjN6srK2kH1vD80k=;
        b=E55M0MIYY1pjghT3xlNIDaKIlUYMtpvmNQxD1KOv99Isig8DZiD4WbIKH3WLQTsyXr
         4UTQCZPVprHv38ez6u9S5uB5yrrs5BN5DEO9X9Nu21epc77tLY0zEeaXJpwB02yqre/C
         E50Afkpp5rlkJQMeSAo48s5m31zrMqEoCQQOH9+z/SUqZYWfkogsjhFuP4KCjMIP4unO
         S2pF1MVB8qadTsfKxBuC0EgnKwUOS/3kjIomtVbA313hpEFb8fx8mQwIispp+p+Nr+mq
         BMA9lPAQZ2CWmERvAFnMyzR6y3ijqbNlKQdk68P92QotPTpytIQidCTPdB8JpBDajYUM
         AvAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794534505; x=1795139305; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        b=bIJNZ3QE32tRNXK4UdDi2m3oIX5LbMJNdBUSlFt4aooVVrOWDOVc7KLsCOsWbe4oDQ
         GqrPD11c4vq3i9yi05tXlcQUHtldKtrlnFLD2V8tDs2kn1w4tb9fcg1z7xt9j/Ww4anZ
         TVL6L9TiDGjEUO8kfA/gdBh1YPHvV7ta1S8YsnS61gAWB6QZr84IVfmqxdNtoYS8OM8Z
         8+QfdPTbUYQMmtcwMvJpBTErCJfeIkhLaeVv+QcjY9pCjrN/T0DMQY2u6hE2CPMjrJFf
         x7JEAL7I6x0JMV7hk1MTLSjf8KD4rc1EKk6TwX5hYnNQ3XVblj8aZSH7NdYl4jdzrhA7
         C4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794534505; x=1795139305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        b=WoAnIXXYVeOj/l10TMz9RmcE0s8qeV6kChGR1FRU5EKFjO8VkEK2gdpbN6BuyYljYb
         870LP8h03oC8nYs/r8DRwakPPeBWiB7bN/OIDKnkSTtAbRXLc+AV9CMXA1xVa6CF8ByE
         Gs1ke5349jmO9X2kq0PdkOHP0Y0C8rHt1TBgZmEIfi43wfRZb4WhUODWebnpycPxEasN
         YrmFjj8NrEseUb88w7sJ1uxCP48FaPzK24I1vOWmjNyJWizPu5Jp1Hxi8fjrI6nO4LeL
         ercNeEcTD7oh5p0625gqLLJyxGSEIAvKVnjkzVurONiGnSKvkbdjN+g7+JzKnW76Uoa1
         bAPQ==
X-Forwarded-Encrypted: i=1; AL+hErFEzpxxe+GS6iZgxWpS9LojRbmPwQWrejKWsxTYfjHtQ3RVtFHZQfo1wxvWLDFHIT7JHsk=@lists.linux.dev
X-Gm-Message-State: APuU4Z/nzSmcs42D3nRlDbyq8/NSXeiDtx+yLcC68WTQNcQoR1lUHa6l
	4aeSlc1y5mKlBGBaSOf67DXrX1x424zTPvoZxdt5exTBZh7UI9WfsgARjmn4hq603+zQ1R+1MQ2
	G45Qpzd3GZedIpfE7dmtSgHw20EywaZA=
X-Gm-Gg: AYBFou1Y8qIaskgd8cZPYQsrnai7weJ+IdiOHXx+z/5WGPajAdhEQuIY8xVXvkjcunO
	fW7+jnIYa1JsAY9pNvoz5gYmhDs8/LRvIftc28JWRTP1+lk/IxTN7EyR5CTPC6esZ8rjaxWwdqF
	1/Pk1VBFbmHRzPOpxcL9AVeXoV4PaIhslWTIHOSca8PytuXe8iunWHLbbJtMDdz35Mn5zIld1br
	sQOxoNvb698x63fXp6Jugg86qxqTgwBVj3QCPb25/pHBoH8jUTWpsp57+bm+NwZWxTdYZ7KBiTE
	Tk3hhD8tu4+Kv59np8Qz6FuhlnKTMeOmYl0M0ZsE1obYf4ZMQWxpceETKlowHY3dYlMr9JUY+bw
	9E0hbcN6EHPuUEjlOxPHkatdTctRdBnDA+icePaOiqbsDxmoS8DxDrDQYNOLjc03UxmEeWRRMHm
	1GqG49nvf7yEOfBjDZSJ38++In
X-Received: by 2002:a05:6512:1304:b0:5c1:5974:8a54 with SMTP id
 2adb3069b0e04-5c1705faa6emr444217e87.5.1794534504878; Thu, 12 Nov 2026
 17:48:24 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
 <CAOMZO5D1XDc7C6H9jYTtpiPah3DnQxJz35t+3k0--a072KsMuA@mail.gmail.com> <avQV+8VrthWpKAWT@shlinux89>
In-Reply-To: <avQV+8VrthWpKAWT@shlinux89>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 12 Nov 2026 22:48:12 -0300
X-Gm-Features: AclHuK_ZlsdyvAp9jZzuN6ezT2JMrw9zinFgseQFdkZHa41yGNMDULrPL8U4muA
Message-ID: <CAOMZO5D3JXGh4FbLs9hRmQMnV-RY65Aq0uosgk+zgv4naQGbBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC data
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joy,

On Wed, Nov 11, 2026 at 4:10=E2=80=AFAM Joy Zou <joy.zou@oss.nxp.com> wrote=
:

> I kept the check as a defensive guard in case the match data table is
> modified incorrectly in the future. However, if you think this is
> unnecessarily defensive, I can remove it in the next revision.

If driver_override is used, then the check is important, so you can keep it
