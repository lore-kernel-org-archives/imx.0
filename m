Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CC0204F8B
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 04:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775019006; cv=none; b=NLp1zbGuSmLJAV/8jZg5NnS4/IljRuluk/F3gfZ8vUImihj1DRIze2PuHfDYk5H1OYV6x1u+GhgyqMNPIFKFxcQTw2YQMeyJzq0LkTtKi/vIaMZh6DXQST0oHUZcutk3la1EGycJLnB8j885b6uHuG0vHUYr4I22cpE1hB/e5js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775019006; c=relaxed/simple;
	bh=cz3Xvg0U0I6Gs5gJ8VAhE+Mmd78tyESPPwAOC1A+rPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQcPkCo3KlMR2bA2asuIpCVDLoW2yBzvSRKezO5UfaREHijW9B0hJ7wD7/BW1ywNd9cHN/4poa1pVTNXe73ZzNEjOUegrgvSyKGs31vPWNynX7MK0crlVG1rHbob7CvN5U1/sI2k8VcMnD5NM249Qyuh0RHjoZ681wHNlE6WHsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IL/SpphZ; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IL/SpphZ"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-128e4d0cc48so7727941c88.1
        for <imx@lists.linux.dev>; Tue, 31 Mar 2026 21:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775019004; x=1775623804; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fHQEld5+nd41UvOGakypuczq2ymCpPSNo2keMgfXMas=;
        b=IL/SpphZTV+xmgquX7/xm5TpKAFxyj76lncoTCGQF23DW7CDXL+noQ/s8P+23PDAo5
         D0VmHvcw2du0/y2BFJEbmDrqShwCxpIU+QqTCAyLKKszH3KUjptW9hc3YbbDU0KILToM
         LkrgKGVPWnCtExE4ON+8PMdLCaKhxecdeMJZcFnl74cfjfixBsLzIccrf2r1IYJHnye4
         zm11TNERnL+oIbwpj58hX/6MSPCV3R8LE+coLPmOox6evPgsWi8oLPTxR/4nBvLAl0fM
         +BAE0Zk/2TzBWpXevat9OrbUVlpp1/eyLFuQEUJ7oaI/ZWhRRhzSvw869pTiI2XWnnlW
         oO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019004; x=1775623804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHQEld5+nd41UvOGakypuczq2ymCpPSNo2keMgfXMas=;
        b=k55OliUqr9x8kMcOmpp2iaRG6rxKyxu3W6WMpuTv8OqgDQYs+c+DJGmDA/HwROO1zz
         cVQ1O/HsFmEprVIrTs5J+I9F3BLm1tmBfxbN7JMMzIum4zjBZb2lv6vHfIUDFiY8gkK/
         7AQ9I+0fXPiWlMVLnMty+tI6wRw5TOsfiP33qsjvVmh3xroMnsEjg7DugVLiN8jayKcL
         aqOStIsBUFowV3K4JRQQJ5JO+W7PxtKhG5tNnBBje1bs1o4M7+QktVTVoaxodoIgFbvt
         TpqJs5g8z1R41FNTa4RzbURIQs00JECOdOoodgks4dUqKIKsmlRmHPlN+hMjptwXluX/
         mCyg==
X-Forwarded-Encrypted: i=1; AJvYcCVujjSZb3yRy6A/aSsh8jvIX7FgMG1I69VlDHaAnv+n6LHsGGhjodym0Dh6ejD8+NB/eJo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkbrVA8tJw/Lss7Gw813b5+NzfVt5cE8bdjZGipdAQ+qWtGeYH
	Zvj4PpJl+TUFa/u/cKi7oJPIAy1XxO8oWpFf2g4GVTcHtQ96x0g/+nYk
X-Gm-Gg: ATEYQzzly9TxPdSeT6QrreWelLRSMGABZcBtgRX+gLzuo8gFxOlsjiKXRc+1Ljd/eB8
	f9wEcjcIldlOZKdQE9pTESDscg7Sw0DOhchmV06xyMgJp6RHUJ8WBI2jHNw0EU237cMlMRxeD7O
	Rn44y1jt/C8J4lyngqLAbN5w9P4AguwO3YKhA0IQyIuJvBjr4k4FznWYc0qnwY798ir6CRz9sX/
	yhAQvqA/395KyuU9AXyzb1hWtk2sMTgOVyJQook88KWPMB3gAPVbJ4lFflsVEyvmR4sOiZoO18m
	pZ+HC8lla0S19zAK5Rbr7tLlQW8QOzyN5WFyv9+oeyN2YRIQUwamcKlp3UVReHLR76iTROLtRGE
	MIslG0LQDAcDOUSDRJ0XOmPwyLyVcTA5y0UYcqs4UPvEDyaIVm1zsR0L90/if506LEi0za2V3o+
	OvCnHNU9Hh33ht5u52Vo2+FBMBd3/EMgEnC44htPoIvehDGPltm2EHX3MEXV71np+Z
X-Received: by 2002:a05:7022:ef18:b0:123:345b:ba05 with SMTP id a92af1059eb24-12be64acde8mr1328345c88.22.1775019004105;
        Tue, 31 Mar 2026 21:50:04 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1dbf:b0e0:8ad0:5a2e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97efb42sm17866414c88.7.2026.03.31.21.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:50:03 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:50:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, imx@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] snvs_pwrkey - code improvements and add report event
Message-ID: <acyj0nmx9MRYGjM6@google.com>
References: <20260326-pwrkey-cleanup-v1-0-d85d7c0bf275@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-pwrkey-cleanup-v1-0-d85d7c0bf275@nxp.com>

On Thu, Mar 26, 2026 at 06:39:37PM +0800, Joy Zou wrote:
> This patch series improves the snvs_pwrkey driver with better code quality
> and add report press event.
> 
> The main improvements include:
> 1. Clean up the code by using local device pointers and dev_err_probe() for
> better readability and easier debugging.
> 
> 2. Fix potential event loss during system suspend by reporting key press events
> directly in the interrupt handler.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Please address comments form here:

https://sashiko.dev/#/patchset/20260326-pwrkey-cleanup-v1-0-d85d7c0bf275%40nxp.com

Majority of them seem valid.

Thanks.

-- 
Dmitry
