Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640F7257853
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758198914; cv=none; b=gUezVTCX35G1pwdRooCmGDbVEWlxCNZnF0qTjGfFLmfMrA/agMhFY/JSlTpl1NcBHiULr/jDp2tlQ2cTY1NNvbYyPPT9M25YAryFyOoLkW0j2S8a1xKLqcqVmodPpY9oWX4vcG9xg0B5f0r2sVLfe+xd9EV/AQVDIPWXOZ50S78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758198914; c=relaxed/simple;
	bh=WmwG2u+A6lb0Y98jTWbQ8dh86e4JAc3PFQPA4/aVVM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGvnTnh87Um0s20Xn4IwE4LvsBA6obvcDjxWxfDwnCcSo0NqT6371pQvo4APkisSuzZWi8chosPlar2liyy07FBa3xpWvvC6XI11qfLTrOah+o58Z34fsxXuHkS9JS85zA9VMuGI1ozCG8xMsSO2YK9vp/ohzeqNzGgwlLh8FUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idj0vOzd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idj0vOzd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2445806e03cso11060525ad.1
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 05:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758198913; x=1758803713; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmwG2u+A6lb0Y98jTWbQ8dh86e4JAc3PFQPA4/aVVM4=;
        b=idj0vOzdMlcYe/M7Ncv3Tt5OMnQVqwqYdscU/NPULhk4MRwWr10U/xruHfjYLbN7Mz
         I49hYI/WmXw32Y/WNAqstfxl2LUcpT6pJ1FMUpyG7vS+jV3b0cGGmxrNMsAmPcEgKBqq
         7D3dI/1yYY3e67sXO4aKm9ODDJ5xhiePNUNG6EeeO9ubTeq+SNDtPv+T3VZuPsqM1PcT
         4mIr1KlQimXfVs+CobjhA2kAZWFoa/rk/ySZ3bfhqOEpyovz6Nw5ZRlLdKWmdvqbA62o
         bbzjdcbdNlIS4NfisjyJeKvVIe3pU8h9+84WWD0EV7lOpl/FedTT9i6WlH+94S4ZUXhZ
         yTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198913; x=1758803713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmwG2u+A6lb0Y98jTWbQ8dh86e4JAc3PFQPA4/aVVM4=;
        b=UzqEVAA6kwggMGhFlu/ip/Vq1+ncINj7Qec24dthtmMwe+mLDdDw92o5kqw4lFs/nb
         qxoV9EjijlB66NaNJgcuFiDjtI7kqqkHuRlVMKv57msn659suA8Rj9zjjJ4bqoyFNyCR
         ff15SKf7ezwvpgwOFOXl7+t26KyiYz34GPdHEHJkxmTYs0Xe54BL4yCIwHmFXhmoJeg4
         C52S+SdwKa83LCzFxRnBdOFNG4d5G0rWHtReQ4N7CF8eKpSkq7+rZiZ3KVrXycmPYues
         Nwy48/MSIdU2hP/WT7/zrJRLzgZNWG5FHY3uBfEFITb1QjBTMqErzwwZcfXcS6DrL42U
         ov2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0UzyLFSo5XAxcAAH4cowUAMOJlmEjOt0e3htkAgi0pWCqjPy71DvCSwp9GBsbbZlm0cA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+X0Pci3/HmLkJ5yviaw3qfsSb+YocpJMHDl8PqfafkcRfHz4I
	Ew5m8OblpqvJzx46QXGiwpaFFpsG2SQ6GH5+zB3cIeAAagM+gNVsI4bI2QSr3uumJUF8ug8VKMA
	H39kyVont9QNfpClgEFp1ksbICog5YlY=
X-Gm-Gg: ASbGncu4xMEqonUlKHgcd8SwrWrdq48s3/9CE7XH23EFCYT6pNHv6U3eHOilfO3tFc5
	LYWW6N0WNSOkf7+fjdWvwrw0qIiNQjd2iClCiIk6erUGmqe4e77keSiC6fJfrArlowIeytR2C9c
	YaLo5ZG88VOyhqLpRRahNOifYeiIl0zwa4ieUAyq88MBvWC8vaA7aXCPRXRMQXD0qQ/IEMPXebO
	E5ApvvZpTeCmBAMvEmecEr8LBsWsKpW1FTFWJUVNqXptma5gVQhiTM=
X-Google-Smtp-Source: AGHT+IF5CLHJIp92USkA4+4XS9SnflXRFNFA4KNQ8mQvZFJgKz7NDJudA8HZO2hgaQ+oWxgXz4tBfw4gYVeBO4KbAgs=
X-Received: by 2002:a17:902:ce91:b0:24b:182b:7144 with SMTP id
 d9443c01a7336-268118b4708mr79285865ad.7.1758198912690; Thu, 18 Sep 2025
 05:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-3-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-3-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 15:37:31 +0300
X-Gm-Features: AS18NWAc8U_p2z0I7kb8DWdQ86uq1YFFMY1dQTrBWLLBGeNxnk_fylcKHlj3yqM
Message-ID: <CAEnQRZDZ+unzySHbvMZaAfjecxWYCicCKbiW+Oth8JL-tZpeCQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] remoteproc: imx_rproc: Enable PM runtime support unconditionally
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 2:52=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> PM runtime support is safe and applicable across all i.MX platforms, not
> just those using the SCU API. Remove the conditional check and enable PM
> runtime unconditionally to simplify the code and ensure consistent power
> management behavior.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
