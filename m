Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9D97262B
	for <imx@lists.linux.dev>; Thu, 26 Jun 2025 00:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750897977; cv=none; b=stSgLBp3jxXRtcNcbPVztTJKwP719aTKNhNqRdhECSOh59qIz1YnDP3n9i5d94PGYyh5AKF2Pjag1YP+YRhiTX3hjL/MXf2+8gdh3/q2ciTry44Hcf3dTkFFUtwpbe1u0BNl27SJw7hx7pXg+62s/a8CRGmXwZXIvq1oNOKbPRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750897977; c=relaxed/simple;
	bh=yuoTVrvF7Uo1dzDLeghFSD2HNx+GhM8K2Rklo6JjyGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lq7pUf75tjYkpvLQXRCsiKD+Dt8w6k9El4IwzndRJ69N+OmsEKDXj9yMEs6+JxQrqOpcUb8jTLQEaG9qx8gUeo0GSvFZ63tgVmhEEUhotf25IAIMznvR0GHT+nZx/cxOtXGyKDa4AKBqjheNgt4uvq9ITjrcjrpwKZCwUbz/xqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BnfuO6rt; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BnfuO6rt"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-73ac40e810eso82819a34.1
        for <imx@lists.linux.dev>; Wed, 25 Jun 2025 17:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750897975; x=1751502775; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8X6fN/sy8ZyQiJgaNrcn1RVnKjXmkhrDdFBrAUFDbo=;
        b=BnfuO6rtTpPSqi72dSSzDC9SI8ZKip04JYk/bYUa3jCmVej0/5uPDOs/tipgo2gXQi
         cVuq3v8mrmzOAffB2UpttTODbOp7ZaswK2ez3zy9peUNnn7sguAJP6sCYbL6yfSI1sp+
         Kv+9Cdn30kR/YWAoWDME26BmijvA2sJJQ/NZ+e0+Xkrd6QZF1BgZyJPhAZMv45i/gdKE
         Zktw4C6p7wE0S+NZ6QqAnEpDw1RHsOIYXnU2ey+X/7z3jO8Cvgf1Lu3cAERA9/0mP3mT
         x1ZBCKTPKPX0MbcaaeLe+6FGgALtd5B/CEdZnOOANu3kNN2ybz0ZTBTvaP+wHHL1DTbl
         MSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750897975; x=1751502775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8X6fN/sy8ZyQiJgaNrcn1RVnKjXmkhrDdFBrAUFDbo=;
        b=VEaeFZ5lqAXtskJtvCdMVAVymHV6ZHGrrAMMr3POcRNo0qHaDkM18sy1bcjiHYSj6o
         8zJJcThh/7PbPUveHLcwkHEN7KAHm8TV9vDiOcfq82bOzFgvLHmr+I4Bvo993Zm3dHCT
         gFP+bHWEkhvBfVICxMfpgYNY18PgOtxf38Gf0VbmyREpmsOZ6OGoQQrbC41rg5zNhn5m
         SNoEhbUXgqhqMHFV/VFOZegYEup4SUzYQDELCH8B4avGSx0ukrkjhlI67HjttBtDNhxk
         +PatIr2M0nK9QEDyygCjiS8AZ24wMplQSIRt2KtQiA6IPLXY695ftQvw3m5ZWqxP5dvv
         48ug==
X-Forwarded-Encrypted: i=1; AJvYcCXz5gV89WHghaKYHxzpl81X6RnZhc/NhgtO8ba6xawns7ccHYxcTu5hVeYUWjAWIykm8Z0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjyhLZlmqF7dxDfD03BBMeYLGMZHOW4Hdhn6MlrUHkwNlv67Yp
	uEv5cI297oHsLs3/a1wDfZD0iUekNVmFT4m1VzxaGX60G8EpO0Ob1GKAO3b1vLh5avs=
X-Gm-Gg: ASbGncvcHva5t6Z76vuQeoeeRX8Qi8mgpvZ1PCNnXIs7faPy6mNpSOvkS8HtJ6psS/1
	DoTelaNp0y6WRLNQ+qT4qIFhuyzr0+CRSDeGjJJUnfo15fMX/zm/a/BqRPTp/CXUzZJXuSv4KLg
	PX7pvhd648vn/Qbf7qxV5ipWzxlTLhLgf0At4lI45xDoafF8Yve/SogfOg3IGI+YHXq3NCjaE7c
	X63ejTQ1aaeHhAQdJeijm8ROmVFsFeVi9BGQHPfFlquGRAimkT7/TngJH9kF6jGmnLxx4XSMXR6
	KTsl1/hywo9JfR7GPJV7yacNpCoCL7R/NBBgqFXsbe+uO2UkcGMQzFeGaxJHGvgaKFI=
X-Google-Smtp-Source: AGHT+IGgCT0aIt2Vk/6CBqJqabPF5GPEQRnBgXUMrXjo+VORvIfFnmUByQnjm3rxOduTuCu1c8Cv0g==
X-Received: by 2002:a05:6871:330e:b0:2c1:650b:fc86 with SMTP id 586e51a60fabf-2efb213638bmr3538638fac.1.1750897974327;
        Wed, 25 Jun 2025 17:32:54 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50fbb67sm81975fac.41.2025.06.25.17.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:32:52 -0700 (PDT)
Date: Thu, 26 Jun 2025 03:32:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <473ad0ce-5180-40e9-b159-a6cfe77f792f@suswa.mountain>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
 <20250626002053.GA12213@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626002053.GA12213@pendragon.ideasonboard.com>

On Thu, Jun 26, 2025 at 03:20:53AM +0300, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Wed, Jun 25, 2025 at 10:22:32AM -0500, Dan Carpenter wrote:
> > This was returning IS_ERR() where PTR_ERR() was intended.
> > 
> > Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> 
> I'll add a
> 
> Cc: stable@vger.kernel.org
> 
> to obey the media subsystem CI rules.
> 

Wait, what?  The original commit hasn't hit Linus's tree and it's
not marked for stable either.

regards,
dan carpenter

