Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F413A9DAD
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 14:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276383; cv=none; b=jNM4A8lTBzjBLX94ouJs8nO6yp2NR8/tp/an/uitbVjkV4jSyMbmTjiJ3feLpIBpm6vZedu0vUrPp17ipSyFunByRaFdDUsbqPege8x50lm9ebWKLjvbAA/gQGQTdyw6fPXxG8WhYkAJsQIh9aIdlLTsZsMBODF1jYptb3ybOx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276383; c=relaxed/simple;
	bh=L314OVt7jzJjhCVDOKBkuT++0Uzl9fPon89IPJAPcK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyyTPhhSkpfPQ79GogOthz8Xdg0Oem613nwDiowoNDRAUuTQssDlgJMK9kmlDY+OT09s9bpMnNxaaNghOxaN0JcwX4UK5VUwmwo1dJsS2xTWQK1DdxOQ2py8PgeZCWDNGFt36oHbFPJh3x0GCBCd4xumGcusVVAiyW2OS16UMYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vtxLi9OZ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vtxLi9OZ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35ba749f441so211628a91.1
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276381; x=1774881181; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZBfJFwgoEUz2EcnixeOofm+Rp3x7VxxVqxoB2WloHc=;
        b=vtxLi9OZQMEFxweyn0+G7dJ4gkrNTOwYRq6qR0UsQplQzSsFAe5i9HBMxqv/jH1Ud4
         cw+e44hiCgwHJJKIcZ4Q58SV8MkHn3u4BKCjExZbZqzauVIJLKkaOaGhpF5Vjs79DKO5
         v1o2aBvvvzDWDe+2AfjKDSlhxCYoGTlZAPm3jECx3gwyUu+OCd+ynkue+U79C+le8cqo
         JYA5oBVxJQnrIuGJtdZf2GVK2K1ZAcegGRZJKqXP49UGJXNobh/yR3yQy7QStgALgTC0
         CVMELNU0+Cr6KiBDMol23FyfT+/B5dfJ8CvWN3wM6YnT3VDnIbuZ9443tLLY57wCeZKX
         ePJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276381; x=1774881181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZBfJFwgoEUz2EcnixeOofm+Rp3x7VxxVqxoB2WloHc=;
        b=E8SM94sCN1smu0OFIZKBVCkb1sOJ/HsDfqv/WR4WzCc5OchZ568yQzeCQKDOO9FCa8
         xMqohv3DH89OciAD7PaW79kiu/S2/fBeWtqPtqtWqJS4OYVpWgCRSHe4G9CFtVugTn6A
         4/1pVgAE60ApQS2/ZGe8w/+Oe7rtbSLCDX+kOuEhpg0FzyNv2rbKT0D7Qo13NlVIDiDN
         fakiKQNTIcgR0/GvRxol1ypPm72XMIXNRmcpVXLm6zZQhmYOqCnIgO9BUpbsQPbd2eVl
         y21iFpYaO/+AID3JKo5yX1garJwfBsJHJLbZLyRhHIJF0644ZW4GfiWo/m7oPu0JVWIE
         6NOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq2S4EzhfaV8GuWv6ouUSREXs+NN8KGrAwJER2lvvyqih+s93WdLTOFxjrYjpxXhyE0c0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCdNwuBANkmIljzITaRsWMn8YKsCibwXjPSBTRt64e7eWwRkgm
	xU7FwBJeEHZgL67qZ+fv1KPntfta858MGtP0bWlQ/sWq5Slpt2bvmDigVIC5LzbXSHc=
X-Gm-Gg: ATEYQzwkEpDg6rUTOnRkEPibGcfMLHyfVrG2RPsLdKPsNtEwlOtdbPRhnKX0x0h5i6j
	GM6pMGP4imB4YtluIM76O0lNfzWClDjaQxrXGw3dTpxqqaU9lIelGNSUyV4kLa04hdFVDJjsVUT
	ExpqrHLi67dvNw/ccmNwmIwwRy+NpAyHDQwbdlGSVBO2eg114927UH6LVvWsOZiX9JfGIpWjVot
	k4hhf5JB/G1XMkaQLu7ZnCKObd89EyNni44+DW7TIJv5IwyKPNUKMFoO3vSojuZHueLzcD9cQxY
	IDyVrrrCpJN0q19wKicXusdeqIuJPTaAZ/qAHcBt1aSfvsEVNgz7MQdlzrLfA7WVfS0qs5AxA8l
	dDrabHFuPRKDWUYcl7yWpJIUJHnj9e+A1b9hKQQ/IytufJe9uMI6gbtY2l3/q81AH6N1c5HJaRj
	6K666v8rQ/hhqQFCKiYA1uq8p6iHPMT7FVIgyu4w==
X-Received: by 2002:a17:90b:3943:b0:359:f22:8879 with SMTP id 98e67ed59e1d1-35bd2cec783mr10505770a91.22.1774276381189;
        Mon, 23 Mar 2026 07:33:01 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:36f1:e61e:d1a0:422b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd262cb35sm4765516a91.1.2026.03.23.07.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 07:33:00 -0700 (PDT)
Date: Mon, 23 Mar 2026 08:32:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/4] Add i.MX94 remoteproc support and reset vector
 handling improvements
Message-ID: <acFPGVNOornxsPG6@p14s>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <b5e05fe6-97c4-40cd-b7cc-b417d8717aec@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5e05fe6-97c4-40cd-b7cc-b417d8717aec@oss.nxp.com>

On Fri, Mar 20, 2026 at 11:19:06AM +0200, Daniel Baluta wrote:
> On 3/12/26 14:36, Peng Fan (OSS) wrote:
> > This series adds remoteproc support for the i.MX94 family, including the
> > CM70, CM71, and CM33S cores, and introduces a new device‑tree property to
> > correctly derive the hardware reset vector for Cortex‑M processors whose
> > ELF entry point does not directly correspond to the actual reset address.
> >
> > Background:
> > Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
> > table. While ELF images embed the entry point (e_entry), this value is
> > not always aligned to the hardware reset address. On platforms such as
> > i.MX94 CM33S, masking is required to compute the correct reset vector
> > address before programming the SoC reset registers.
> 
> What happens if the reset vector is at 0 and the e_entry point is at 0x800...?
> 
> In this case masking will no longer work! Can we implement a generic approach?
>

I will wait to see an R-B from Daniel before looking at this set.

Thanks,
Mathieu
 
> 
> >
> > Similarly, on i.MX95, the existing implementation always programs a reset
> > vector of 0x0, which only works when executing entirely from TCM. When
> > firmware is loaded into DDR, the driver must pass the correct reset vector
> > to the SM CPU/LMM interfaces.
> >
> > This series addresses these issues and provides the necessary DT bindings
> > and driver support.
> >
> > Summary of patches:
> > [1]dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
> > Adds a new DT property allowing SoCs to specify a mask for deriving the
> > hardware reset vector from the ELF entry point.
> >
> > [2]dt-bindings: remoteproc: imx-rproc: Support i.MX9[4,52]
> > Adds compatible strings for i.MX94 CM70, CM71, and CM33S processors.
> >
> > [3]remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
> > Ensures the correct reset vector is passed to SM APIs by introducing a
> > driver‑level helper (imx_rproc_get_boot_addr()) that applies the
> > reset‑vector mask.
> >
> > [4]remoteproc: imx_rproc: Add support for i.MX94 remoteproc
> > Adds address translation tables and configuration data for CM70, CM71,
> > and CM33S, enabling full remoteproc operation on i.MX94.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> > Peng Fan (4):
> >       dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
> >       dt-bindings: remoteproc: imx-rproc: Support i.MX94
> >       remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
> >       remoteproc: imx_rproc: Add support for i.MX94
> >
> >  .../bindings/remoteproc/fsl,imx-rproc.yaml         |  9 +++
> >  drivers/remoteproc/imx_rproc.c                     | 85 +++++++++++++++++++++-
> >  2 files changed, 91 insertions(+), 3 deletions(-)
> > ---
> > base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
> > change-id: 20260311-imx943-rproc-2050e00b65f7
> >
> > Best regards,
> 
> 
