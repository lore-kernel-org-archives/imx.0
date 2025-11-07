Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238F22C1590
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762502056; cv=none; b=L8AbaM/nrQACr1BXfPrFtfIpJF7Tr0m1VxlRa9YwrCEqhUyzWa+6gixDGexUNxbm1uO4xgmndRs1+qM3zQmK25vOpaX9HsbLe9LgS0ZVcaprEsRl+1L2kJA/bxNLjw4poPphD09tg/ei4pBSbeHi6dOZRXvWonuvQjOEXBDYRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762502056; c=relaxed/simple;
	bh=hht2khT+M/paWxzoLF4glbCzxzDG6WfHD/Jh8JDmVm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWKVbCDOLphrnnPOTaN+bZEQOsJy/PR2+vNOP8jv1j620hj2vMNwOlWJZB6IH5DcYqeCyvOmlyJd2NDzIIVA5X9i7jPH2C+knZ/wB6vo7KJ+wLSU41f4zta9mUu6X7NvXhrn+84OZX8tLdM3orfJDsX5Rmd5VlNltPY347F30bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUaPwdZD; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUaPwdZD"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7aad4823079so453025b3a.0
        for <imx@lists.linux.dev>; Thu, 06 Nov 2025 23:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762502054; x=1763106854; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hht2khT+M/paWxzoLF4glbCzxzDG6WfHD/Jh8JDmVm8=;
        b=gUaPwdZDT1m6xHtwj9ziAkG5U/tBRTQrhgREVTL9Z0cw9KWvhN8iBRHEk9TEKvjfCz
         QXxmf0mO5u3IuK05W5ka3uLA169TBSu51R3TfWVAdR20OaTKT+ke3kCh8aBh0c5h0AGb
         eXZy7FGRcgI/Pvf5VtNdJmMVhA7vrg4PTT26/6/+cZzDjCPo9gOfuqxQ5biyf51nwO9c
         PotUi+R5ynAF+qrZ+nzRodN1M7Ixd2Gmke1H9tLejZdOat3eEm/RgNOSPYlRGWU9G1fo
         4c9FIbPe48ggosC230hAzcLXaqyqjQzjT4/oFo/reoKL/cQcmftFxANueuRQoKdtGfxE
         OuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762502054; x=1763106854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hht2khT+M/paWxzoLF4glbCzxzDG6WfHD/Jh8JDmVm8=;
        b=JwSKgoNMBIvBhsi9nSdGh8mKmsvQGmWz+MejLy0Nb9MOLJb6SnrDnrscvTopMBq8aN
         tPFiewadRRSk7gOMHNpDmYL4s8NGqe5D5Fwh/qRpxWXmto2ZXDGcPJGX/GtwkwmOUEo2
         9aEi29UU8ZUJHniMj49lCHt7j2Rjf563rGi0gswWbPxoOuDrT26sCamTstglQwjBnEot
         6KXoquyVPhq/P24+j3WhU21jE/Sahq1ooQ87RlcRROPjNnA/RBcViD79Gd1wk/QmsYsJ
         TExLJq4MjddOkkex/nGAyCaQget4AixbwMBCnkHeF6VMZoAQqrW1DN/WiRxcn8mcO58E
         tZig==
X-Forwarded-Encrypted: i=1; AJvYcCX6bFOMHpDLhI7XxxdIY4lBmyC5yfJQFU3bnCIqZf9kJMpxM9EIU7P1A5SQyCxI3Sl6fJw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywim8GX0h3Ue4BayrTQ4C38tBvzdqjnmG0vLxNFxZpk7MbcpM/n
	SvWHyYukdYWnIW3APdLgewuCsaLNo8SHNDgWzEvgY3fF57FtfMo7NBIOU+n49dLfh7FOmIPWvoQ
	GTod/63jX6vwYZDb0f/Yygh2dBxMThEU=
X-Gm-Gg: ASbGncsziNetIpZRn5AA53o8qet5XvrBfP02XssMOILTgeCQ0LH+zV6K7bd/8PwF0Gz
	uwPyD40d55XLWoDXdEq9vAac5t0Y+9WxBaH43qIKvbJBot3hAFMH86bRLl6swueZygl2wksFm5p
	DQok8Veg8xQr+yS5en2//pC/rFZaE8H0DJYebsqorfAd62mlWrYzG4pwl8EBD9cL5E9s2HrEK89
	QwrFQuajTnqIhj0DznLrLStCL5IMbLTI716Fv6h9UduHbhAG9mL5v3xxw==
X-Google-Smtp-Source: AGHT+IHL0mKF9QQYctg7K2SDNNvhbCsy5jQOa37KMcgcdBvRiNDOg88v8nsypzK+cTSQzbs7MXiMalVatyoMujxAM6A=
X-Received: by 2002:a05:6a20:914f:b0:334:8e2e:2c55 with SMTP id
 adf61e73a8af0-35228572ba4mr3084918637.18.1762502054278; Thu, 06 Nov 2025
 23:54:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com> <20251031-imx95-rproc-2025-10-31-v2-3-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-3-758b2e547a55@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 7 Nov 2025 09:56:40 +0200
X-Gm-Features: AWmQ_bldmBxOD-3eNLQss-begsdemT3T5zDmdImzkOkUALSL6znnWYvoGByIzsQ
Message-ID: <CAEnQRZB4szsOxtP2QmRdpwR+ZJ+8ydGg8hGAo5DqHC=tw23M8A@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 4:28=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Allow each platform to provide its own prepare operations, preparing
> for i.MX95 LMM and CPU ops support.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
