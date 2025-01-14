Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD465227BBA
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 01:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736818278; cv=none; b=Zg19sdMT6ATlQZcti3dLZh4yRHyIArZaAABaJtqlEo9oMfckvyHnFJlrW0hd1QKOC2jlqVnByJmRamGEVUox1fZFH/GttKmcDGwyR1Z2OqfOSUnVqSIQ6qUia+MHvTz7ubs+0amaG4BlAyMZ9XwhfNFnCGEiThXT98BZC60JwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736818278; c=relaxed/simple;
	bh=RAc8JMWGHAEq/1zAnmcjYAkTf3sEC2U7lszSqnBPbgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOU7V0ZW7xM71c2P8sWoBhpUTshf1qeo20By26i05/rzf/UJ6aQACkslTQ1yU7AwH7wYhsqWr4vqy9elZEcMLeqziM+n1iVinITpS6Bv6P4n5HNAJydad9FhLbb2QLzaE41a3LcBh7yOn2ZHX2G1gDL0aoTKffFTlCOnEEvpLWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1ekFAPO; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1ekFAPO"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3043e84c687so37957791fa.1
        for <imx@lists.linux.dev>; Mon, 13 Jan 2025 17:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736818275; x=1737423075; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aU6EnYM1FFu/Ni2NC3JHueKkzhR3f1t7juJ8cBXKNg=;
        b=j1ekFAPOLWUqB16YvEKkPGAsYUpLXyNS94S8PX6sioqpNHAozROBPnoxtnt03WvLWH
         7hKSRWNWFhyfX8uvs0vrxsRAmkfxVvt/vMvlLHOwkLnq5OKxrBF29aBcPQ8ZOFzgKPIu
         hk//HTRiV8aISfbODSdHylJkQ+bOTszdjZWYa54pDzD+IpsUhyLKFPbSSWSGHma3wCeD
         Pc9UP/JMxwZE40950w3iqPXSA/oUSYdYrTEsuGA8I2FH//zTle6PCFxnwKW2JZFtkikJ
         RTsNMMwRKD0jU1xjQTQY2rHANIePjOTDdZ88LauA11O4dct9f+A4d8qZlLrq6gttNzZy
         ESgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736818275; x=1737423075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aU6EnYM1FFu/Ni2NC3JHueKkzhR3f1t7juJ8cBXKNg=;
        b=HDkfwiEwQyWKFT+ZfFmvynGuhBbPDz6cTryOY1uHJUV4ewdhpXmPV1qdM8Jt4ZPj+i
         DTIyc94DVsdOZI67UXHh2iAe2kjfBoYUVbQ/1OOfj3NKLafZDUDCWp10Igh/u0OWptYj
         LwbDjexolo+cDMprtXiaAFVO/7R1jTgAcVoXyZzmsBwYALrwu2zzmZjcezQE1cHY+PIk
         c+U1qq81DQ/xuqBSdF3Po3Ohhj6j4VSfSXIpoX15BUhmIdYVYxFhyIZY547KIEwZK76O
         I5Um22Fjk8V8S4mFB+AK5VX3huPvQaz08FY3CIP2ihQ1nNe1ZxoENmhVBxpy3wfX1H9S
         blWw==
X-Forwarded-Encrypted: i=1; AJvYcCVQQz3F8oKV/aqe+UQg1S7DNG199p9L2YnIAHQ3/F1N1PgYv2BRYM4OjEBPaWPWQeOSDb4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAmrtGnmfCvAEN6m+dxp5juI93lBQALKOwB16U3alVnZp8CH6b
	yAmC6+V6dS0f6/x3vg2Cp07YfS0xAobECA12cEfR831dWCwkLAnNgshtaMqibiSwDU2Grw1t82H
	e68zbaHI4FrjLCV3A+I3OuRaRPc8=
X-Gm-Gg: ASbGncvFyjhJuvA3xYoIsfVJickiDrN4LfhAgKzBvhLe10Vr1dbefMuAHYhKqj6kW3j
	e1oApKtqG1mfS6pDXL/W8Mf3t4yBxpHrX7iDhpmfo3ewjKY0gd4QtoN/8qLkU5tggIOLaKA==
X-Google-Smtp-Source: AGHT+IEUJmr5CzHShAQpgO68JDpagn9ocRTq7BeVsW6j7XDBWpIfZvawE2F15mzspC+LVxD1aFCcu76BGOg5HtppGiQ=
X-Received: by 2002:a2e:be10:0:b0:302:52a8:243 with SMTP id
 38308e7fff4ca-305f45db514mr82377271fa.30.1736818274651; Mon, 13 Jan 2025
 17:31:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250114011818.2401479-1-xiaolei.wang@windriver.com>
In-Reply-To: <20250114011818.2401479-1-xiaolei.wang@windriver.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Jan 2025 22:31:03 -0300
X-Gm-Features: AbW1kvYlHMYh_9BWfuP0hql59S9fdsu1xJunec-2pANaEdOBUzmqZvZq2hVMDbI
Message-ID: <CAOMZO5BpBjPhr3Y_+28ob48N-6GMaA640=d=VTVxfz=vq5PV7A@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: imx8mp-blk-ctrl: add missing loop break condition
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: ulf.hansson@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, ping.bai@nxp.com, l.stach@pengutronix.de, 
	marex@denx.de, aford173@gmail.com, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 10:18=E2=80=AFPM Xiaolei Wang
<xiaolei.wang@windriver.com> wrote:
>
> Currently imx8mp_blk_ctrl_remove() will continue the for loop
> until an out-of-bounds exception occurs.
>
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : dev_pm_domain_detach+0x8/0x48
> lr : imx8mp_blk_ctrl_shutdown+0x58/0x90
> sp : ffffffc084f8bbf0
> x29: ffffffc084f8bbf0 x28: ffffff80daf32ac0 x27: 0000000000000000
> x26: ffffffc081658d78 x25: 0000000000000001 x24: ffffffc08201b028
> x23: ffffff80d0db9490 x22: ffffffc082340a78 x21: 00000000000005b0
> x20: ffffff80d19bc180 x19: 000000000000000a x18: ffffffffffffffff
> x17: ffffffc080a39e08 x16: ffffffc080a39c98 x15: 4f435f464f006c72
> x14: 0000000000000004 x13: ffffff80d0172110 x12: 0000000000000000
> x11: ffffff80d0537740 x10: ffffff80d05376c0 x9 : ffffffc0808ed2d8
> x8 : ffffffc084f8bab0 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : ffffff80d19b9420 x4 : fffffffe03466e60 x3 : 0000000080800077
> x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
> Call trace:
>  dev_pm_domain_detach+0x8/0x48
>  platform_shutdown+0x2c/0x48
>  device_shutdown+0x158/0x268
>  kernel_restart_prepare+0x40/0x58
>  kernel_kexec+0x58/0xe8
>  __do_sys_reboot+0x198/0x258
>  __arm64_sys_reboot+0x2c/0x40
>  invoke_syscall+0x5c/0x138
>  el0_svc_common.constprop.0+0x48/0xf0
>  do_el0_svc+0x24/0x38
>  el0_svc+0x38/0xc8
>  el0t_64_sync_handler+0x120/0x130
>  el0t_64_sync+0x190/0x198
> Code: 8128c2d0 ffffffc0 aa1e03e9 d503201f
>
> Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Thanks for the fix:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
