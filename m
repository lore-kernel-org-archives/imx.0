Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99A374CC
	for <imx@lists.linux.dev>; Sun,  2 Jun 2024 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717324868; cv=none; b=gzTs52//DXxby8FcHAwjXLLmwJjMZQOWF5a5O5E2KUAaC3xmeJf2k0XCYS+FM7AYF9ZcvUTKp4wiHXgb5DA/YSptZAjSLu/m/sBKm/e+3ngAEY+i6PhGosDEqTUc8+ACmgtLHqzfl8ByZGJz8Sh+hDpxiYNwIFLzZFDzCbdLA8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717324868; c=relaxed/simple;
	bh=4lF60Tp1ZKHlgeQKqBEl0y1eoXo68jynVkVk5IO43gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sCeLsb9S25KsCqbm2ifSMaPTX7XdymGCBkmU6Mjv675IESmMsdPjqs7YIrE78eJ86UsINgAaGiUoSqDAlgUo/DmyMvGbHpigbARXp9cU4zCkjBMsIKg4eBXIkgA+SP3OXUYq7RKUYhuIUAxb/xujtL8QqdlCEomw9xy+rBdVyno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dBELLvR9; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBELLvR9"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfa7873bab2so1704521276.1
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717324863; x=1717929663; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mFM4fI0BfVhoIuFo3oNmTS1/Tw1vlv77X7lObWK8gXo=;
        b=dBELLvR9F/pthWJJoa09JJxLrqrB9ESQJOI75yyVH8VOLvuS3yPMbJFHVrWsSzzcuG
         Tm+TO2RwEJlOl6/GGSkG84fgtfaRGWO2UkcYOJhmODhvDxOW4qIvGk3mNYouJoaw2Xvy
         HrfVF1ytNXCpw23vEHDtb6rZECmwvlU16PT9RXAKJNangAiSl6BpCISad3Z2zOwG9OHR
         vGkiCmJefFWPvMWORSikjdTa8k/tnaKP1GO5QwG4bv/E5Mtz4MvBay5h6U+Ptg6PrAOF
         TwWwc03upQrayEAFIpimjwxzUUMuDdwExcnYUkLXSLlAd9SCv0YG+UDe4iA3QZXgDNMf
         Lh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717324863; x=1717929663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFM4fI0BfVhoIuFo3oNmTS1/Tw1vlv77X7lObWK8gXo=;
        b=Q57retNjFjO6W7cjxba109vpPbttJB2Q9VnmQJUmnf/EDjW7E1VPHBjDCEZMLt4yN3
         H9/9Zf5jsG0Mt3TU00/2/f7N3uuPtplyZ0klxxZpzTd5s3wbMVYD1/QtrUPPJKmAAEQS
         XZwguCyopVeU93zlVeZhwn02m6EGD7OtCIQCpDys9Ui0586bXxlhTRPiBUN9pVC68J6j
         8g6nXK0gDXCqnRGB09UPULKSbpFvlZslvAPeBxT7tkLczMRzwE3Vf7GZwO7/GBYAZicU
         loL8o3qJvND8qKLoTQT4+TV/HXFi3WQ8qlwgZZDNPE/1xVoAEuWenwI0G7EUKp/8/i+C
         zloA==
X-Gm-Message-State: AOJu0YwjfpByVBDj/nojfHMFPsNEi/ouiJUSIuj3ySLZilWCnHEjlfqC
	OYYF3JgYk0LOFwsjx8G4XzRba0VBEgI2NGEk5XZKRieJFN4umoG1OqIDFddL/db1Ga7KYegQnjz
	2RLPIU7YTsehizgkTmPHT+M5WQcji0L4ErJ/3Gw==
X-Google-Smtp-Source: AGHT+IGAvjZUn9usqBaQXStHYMiIq+xkcrPxemQDbOh6Td+kMNg2WV2GXfOZ2G0rsURmY5+qN2Tsi0NdkrstgDyKMNk=
X-Received: by 2002:a25:ac95:0:b0:df4:ab39:8c1f with SMTP id
 3f1490d57ef6-dfa73dd2735mr6280143276.53.1717324863129; Sun, 02 Jun 2024
 03:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240514030718.533169-1-victor.liu@nxp.com>
In-Reply-To: <20240514030718.533169-1-victor.liu@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 2 Jun 2024 13:40:52 +0300
Message-ID: <CAA8EJpra3jfmhEmAM6PSpu6eKNdMGuNN3eX2r2JT6YEd7hWsiQ@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: imx53-qsb-hdmi: Disable panel instead of
 deleting node
To: Liu Ying <victor.liu@nxp.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 May 2024 at 05:59, Liu Ying <victor.liu@nxp.com> wrote:
>
> We cannot use /delete-node/ directive to delete a node in a DT
> overlay.  The node won't be deleted effectively.  Instead, set
> the node's status property to "disabled" to achieve something
> similar.
>
> Fixes: eeb403df953f ("ARM: dts: imx53-qsb: add support for the HDMI expander")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso   | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
