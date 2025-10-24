Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8E11A83F8
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761317829; cv=none; b=BXuU05FMkkqE/6vfwikkpuOOJdhOPTSmakZEqz9IpHHtbmIUOut4tZ8IF/4ExcaybWxaG/HEDVA1KQQJmU+5buNAWbw9bJZzMHIZphUMA12UDv26mR9qUsy78n7VSPbA1i0FX55VEcUdarj0lUBeLbtfwmN+mgUzNr/DmxOzZ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761317829; c=relaxed/simple;
	bh=2Gdzw3WVYRJrj+tAW+aUSUhL3LT+JzMOvceW8cfS41A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JeoJ5XR9rIR4uYlN1dawGnYH2E5mYX4BLvc7V4foARMyLFI+yXiH64G2hfVjv6OTAoo15JUHa/BxCJUk6VrUcplyzvQDWExzYWM15hYaJBmqI3aZTne16bAVgZ6ETtS+gi8BqtgouyvalGQfWI9s1ravqYS7Xrg/M9KbKFKCVrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vgqRneYw; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vgqRneYw"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a28226dd13so1198695b3a.3
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 07:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761317827; x=1761922627; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNgqejn0snMI7/1tTSNTK/NI2vBJ1tJBuHbuhBMpg0I=;
        b=vgqRneYw7ItwCLg+MwL4CXLxvfetFHa0QOUfKbkdKlFcLu09yXhkITggwIt4CIIIDm
         hiakZGY6WceIqxzPKoWx823FNCqHzAcSKCQ+2UARXKw6xizDFs7OatmuxGn/fsJffxlh
         7/uslc746hZAApBrcpR7tnQFbcPCcgg1eqHLJ9Iim6iDcW++q3tZXyFYHZ6yicYsE7dP
         cMMaVoBmaRuQcYNRfeiKJZv9jHvgOhKWwrU9ruxe/JdV6TxYRcC82A1Ok58lSE+9E9My
         NsfmL2SMec2xPLsKtYj44hrfz199H+xGwVCLxcoyIpzevyJk13uPXYUgVDFTXDVP7/mE
         Q5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317827; x=1761922627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNgqejn0snMI7/1tTSNTK/NI2vBJ1tJBuHbuhBMpg0I=;
        b=q7cA/4u+Aq8x/GUc5Q9IYQxAXypxHL1k04sLGAHuPRYXxjnF+A33/U4LQZZPMbj3nE
         m9GTr7ZCpMqY5kJtlVi1ey/yAD9xIPNAup6z9sPtIlve3SqtExoacsGuEbL886GJzVhv
         dH6U7Veykb3KGFVxrMxBvYDtg7zHmj7qjR0lPz7mwmQs1l88wnKKVoLfVVY2qdZ/K5rF
         8GVU/NS4dUYgUFy9GcvyY4SRzq1BzK14H/VNrGbGz/gFBerRYRi/oNT/hyHZ6n6OTD9G
         H6ONpb6d27gCpAugGXums8oVV+p+AfiBimrOL+MvPM/lXOz8izaVQ32RLJNo2RA68dJ5
         sT/w==
X-Forwarded-Encrypted: i=1; AJvYcCWirvbxJHQP6o/7i8vOGA9r52cXo8iM+Nl6Uf1pc7F4MROg6lyO4oQnUBP9y9bFB5i0L9Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzADr1qIB1XcuI6LCZKlSLUKNYQBJs38LDHCCoaAs0QL35aTv/+
	9MPkp64ZMgpXtVc3rYj0dWzGCkVpSw6GYMEq8DlZwjdzobSv5eQ1GAllgOvuNE6i2oo=
X-Gm-Gg: ASbGncuxJ+24vwTyFMlaqAf3SNNfOK1UHL05xjGkwdU9Xtd0j2BBHGgbCEi1NcbLs90
	xDrEhIfMJfyhkYwi4WyQ824t0F3tBM7BtSO3vLtUkmvhp0BpprQJrr852rozlpFFrPDWKnCl4cI
	9Ulb+MnL5MVwKDGzoh3cHrS7nqeaIOay9Qilibew97d23XgeShETlrUsxPdwtlGyqsFaZmbxlCC
	X7aNGRaikZgOkegfCf/X4S8AawuUvbfyp9nIVjzr6npdF9UiTL1rayAW03EnS+85zdOKH83lu9t
	tQysEe0yUwQyi2OBbIIL0GA4B81huwxRVNc/xuP7S6gFL9NQf2m8I9laBPOHyVvs5wHvBl/sRBl
	4tOMHZ5Nh/mOfMI/GTTw9VHML47lPsXLMvaNRTTHTcwVn0foHdomiSg9NZJWNizcN53cKKKLffO
	8fI+fXs9HlSYXL9w==
X-Google-Smtp-Source: AGHT+IGnvRnOZR3DiY7JhKO8SRec8hM8slbNby+lqNU1ekdPW6OjTB5ZanBZl2r0I0MYXIlNVfB9eQ==
X-Received: by 2002:a05:6a00:22cf:b0:781:1481:897d with SMTP id d2e1a72fcca58-7a220b16cd0mr40051833b3a.17.1761317827102;
        Fri, 24 Oct 2025 07:57:07 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c4aa:f655:2dba:5bb5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a64d75sm6192792b3a.13.2025.10.24.07.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:57:06 -0700 (PDT)
Date: Fri, 24 Oct 2025 08:57:03 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] remoteproc: imx_rproc: misc clean up
Message-ID: <aPuTv5RCWo3eGc5y@p14s>
References: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>

On Fri, Oct 24, 2025 at 10:51:27AM +0800, Peng Fan wrote:
> This is the 3rd series to cleanup the driver.
> 
> Patch 1: simplify clock enable logic
> Patch 2: Add a platform detach ops which will be easier to support new
>          platforms
> Patch 3: Enable runtime for all
> Patch 4: Drop method assignment
> 
> This is the last patchset to do the clean up for imx_rproc.c.
> After imx_dsp_rproc.c moved to use platform ops with swith-case removed,
> the method entry from dcfg could be removed in the end.
> 
> Tested V3 on
> i.MX8MP-EVK, i.MX93-11x11-EVK.
> 
> Tested V1/V2 on
> i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.
> 
> Thanks to Daniel and Frank for the internal reviewing.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v4:
> - Drop patch 5 which updates MAINTAINERS entry.
> - Add R-b for patch 3
> - Link to v3: https://lore.kernel.org/linux-remoteproc/20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com/T/#m68811fc8e9fc92d2c091926b0d5e699e8d888fc6
> 
> Changes in v3:
> - Rebased to latest next branch
> - Resolve the conflicts in patch 3 to enable runtime PM for i.MX family.
> - Add A-b for patch 5
> - Link to v2: https://lore.kernel.org/linux-remoteproc/20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com/#t
> 
> Changes in v2:
> - Add R-b from Daniel and Frank
> - Update comment in patch 1 (from Daniel)
> - Update commit log in patch 4 (from Daniel)
> - Include Shengjiu as maintainer
> - Link to v1: https://lore.kernel.org/r/20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com
> 
> ---
> Peng Fan (4):
>       remoteproc: imx_rproc: Simplify clock enable logic using dcfg flags
>       remoteproc: imx_rproc: Make detach operation platform-specific
>       remoteproc: imx_rproc: Enable PM runtime support unconditionally
>       remoteproc: imx_rproc: Remove the assignement to method
> 
>  drivers/remoteproc/imx_rproc.c | 90 +++++++++++++++++-------------------------
>  drivers/remoteproc/imx_rproc.h |  2 +
>  2 files changed, 38 insertions(+), 54 deletions(-)

Applied.

Thanks,
Mathieu

> ---
> base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
> change-id: 20251024-imx_rproc_c4-89967b4158b6
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
