Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12C71D63C2
	for <imx@lists.linux.dev>; Wed, 11 Dec 2024 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932755; cv=none; b=Wd2YdVVzvSD9ByUqnNT6XpVubLdmGeILpOfFQPRmRRAa6MALkKUEcPBxFpYyVKe+5d2RrOFeqB52um/15sojY0+pdZsF2BUGMoAcQOI9JW6wRE47oWHHn54KO/4SBjVwRQnDfJlFDtXcqVNb+A3o+qTxcMzrcKyh0weeduIkkdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932755; c=relaxed/simple;
	bh=PStEIKVCBoB+LDS+e+Ey3xMizBgpYogWYnRK02FOek8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DavYW6oMWhFhgSqruil6m5HyGgWTE4vvGTV2WTfAw9lLkoFgDZ6rsrjldtFdO3BJlw9M/ZhRWi7QlL+hUlVxOLL9yL/mbXFVoZ/5DLKeIPn7bkfPF8I3u67NKTxo3W+RA6M8QAxvYnPuDyJTH/1hX6jM9+3EtF1ccfZWnFCaEMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFEYbeiH; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFEYbeiH"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3001e7d41c5so60386191fa.2
        for <imx@lists.linux.dev>; Wed, 11 Dec 2024 07:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733932752; x=1734537552; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZChbzObT8yiyu3oc7dwGuAXjmHiQ0fUscqfsIIfuVr0=;
        b=DFEYbeiHSQtpo0KgGDUXf1H34TSv7z5S6BfnQaSUuvITpndvIuKyBMe7nej5NSG7G7
         Pt359vADTqGxDhXCCIA7uIHGGqrsYCe+tppd6yhI9c8fymsxH1EYldoHsOB3A2ssSC2C
         lWfDx5h3DiWnKRpuh1Y1yTvZVpi9/6wz3PfCsSa11dwNC6P/nuaUZlWZWgDUWIuye9UI
         JN84Y5YjXkeH8rsljdWDlbwbsk9FwrB8Z810hEtPxTbeetuhRqKxU/53EF9yRBsdwPs+
         dPN+s/rWE86NN3HBJyfI3Fhjf6tY1WBFS88Dr2fHW7SnNzhIpkZkpCHu8kah30OPCDzo
         56VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932752; x=1734537552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZChbzObT8yiyu3oc7dwGuAXjmHiQ0fUscqfsIIfuVr0=;
        b=kmaC9WCTodnh3Jn/3XHswUYW9lgqQflj9KN3PNqf0FdmMee5SyWhR8c7re26vSucTp
         yK3onV5jm9o3bBZp/nrZbfkWyhQ2dvDkPMpfvCviqSYk2EOU+ObSoxdIZlzNBS4qjBBZ
         7frFD+occ0/msw3fkx74tPtFtJhtmqilfDloiatfU/QjnGr8D7I/lbDjMa4vh9ON/RZN
         8DL60fdIF7mVyReyqNSvLB6B6DmPQoMNGkevmLdGAzdV9ExsA9ztuo54WfKzJM2Pn6Pn
         0rmHxbI8f4EZ79U6z2tkflY3HdsOSLPJ5Tx++wWVeWfS+FTijAj1TiYz8xHlKMITeOst
         M1Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWULunZxAsDqGV3tUFaD0GghAmjZ82YVFUiEzeWDqJ0lQ9cNssefgJfL6TD+60Hn1IGUNI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyS8ICIYUms70Fw/x6NJemC4wTcfZ9ee8T9yXQCyv/yQVBO3Roi
	b06MpORMXS0cEXiE65nUwFSNPIJbN8a3bG4+MYGeeoBelFjkbHfE9DpzdQs90mpqzOoeNCdXVoU
	RIK2fv+SY3lGEouQrM4NV9qvJJi0=
X-Gm-Gg: ASbGncv2pxm7EqKVUVzIKW/GteRWUEqjbA2i/pGVM6JEk5s1i1Rs7QmvD7NOgIkglY9
	ztP8T02VE0cMtXevfMRGR0I7+35vKKg1eMUCK+6OBNK/Jf++bmi2vejlRT61NhUwLRXE=
X-Google-Smtp-Source: AGHT+IGjjd845gZqD6VbvGu8xD0QWI1LY7dIDKnnhm4caENDAWdY8siyqutCix247rdvw0pP+hHXXkECcEPStZBxUKE=
X-Received: by 2002:a2e:be89:0:b0:2fa:d2c3:a7e8 with SMTP id
 38308e7fff4ca-30240d4a03emr12884291fa.13.1733932751765; Wed, 11 Dec 2024
 07:59:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210-imx91tmu-v2-0-5032aad4d88e@nxp.com> <20241210-imx91tmu-v2-2-5032aad4d88e@nxp.com>
In-Reply-To: <20241210-imx91tmu-v2-2-5032aad4d88e@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 Dec 2024 12:59:00 -0300
Message-ID: <CAOMZO5DC=Y=BU-MX0B_ecOBnkhbiUXXKDDYgn4-uhDNyihOXoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] thermal: imx91: Add support for i.MX91 thermal
 monitoring unit
To: Frank Li <Frank.Li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Pengfei Li <pengfei.li_1@nxp.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 6:27=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +#define CTRL0                  0x0
> +
> +#define STAT0                  0x10
...
> +#define DATA0                  0x20

These generic short macro names can easily clash in the future.

It would be better to add a better namespace definition.

For example:

IMX91_THERMAL_CTRL0
IMX91_THERMAL_STAT0
IMX91_THERMAL_DATA0
