Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5984E1C8D
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717369; cv=none; b=ovi5w2CESwa1Hio6me8bLf8A6PwCGtpV+Sy788F9o5DVdJqdogs7jymvc5ZKuAVshk8/xnJlN64OLz0eW/9M+fVGPMckHoTqvKqnDTP4L3M643CfBhALt882nvVFEba6sXo+7R45vLKie+F/TKZBNQekdVtyKSYpemutcxBtk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717369; c=relaxed/simple;
	bh=ySN2jKS9dHhRYoH81doQjhzbQkfdJK+9O/ToilcRwv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WL1Qt5Pyh6vWugoSOpR3kmS9lN+UMs6SQ9INTDV/vncwYlmnyk5RGpGBbVRcNYz7MeK1ohZ4Gtd0tf6kzmy7GaDltZR6eIeS7NOSU79Lax3ve4zazvgJHMEoLBHsRARW4aNY6NBz3mgfraYZPx45HefH8w6Ngoy8g/pHluSz/Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=Ml+9zNBY; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="Ml+9zNBY"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88103e47f72so3238457b3a.2
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790717367; x=1791322167; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EyT+xHf5qLUoWCtLPqQerMtkJAwK/AAEHgHwEUT5UR4=;
        b=Ml+9zNBYYg9DiBpfLDD5OdijQm+iGuyQMGBYpErRuXEM/fNhk7A50Rh7vURDy29MYI
         Gxxe8RjXZq8kiJ9AZqLHYuH1tvj4ClSUisNlNO5aM2IxK89oxpHUJIGxZpugV4+8MZ+e
         fiO9opr1nnXf3W+5+dXtueU+dzqkVEV1NACxUs1rsph9pDilkBu4hEpYe8gwjNRwG+Nv
         Iykn0ei8DZ3/b25F2P33E3bI+WtRn1mMu7LX0S+yGBXJLz+7g0ZTvGqnvWgY8ctS4WG7
         nxFRkR6/UhJaqfxkBx7ne0Oo4W0yVl712Ekn7+eBjJbvcudOW3avJ2vYiPKzC1IxPcdz
         CZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717367; x=1791322167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EyT+xHf5qLUoWCtLPqQerMtkJAwK/AAEHgHwEUT5UR4=;
        b=2jWyUX4yHy2iNvpwyD7FML4wc1wBiAS7QzEyzQjzPZ0tcJdAdunRKyNOCpkrMoCRmz
         yOv4H4A0vhd9B6dR54Kn9aYbIY3dBjT/M8FNkmmQUjHG68+7MkONdnKLIRIbrKaYyjHP
         9C5dN3ONrSCbKfcpuv9KGXbMkLKwPWq+Vm8iP1TfC3tpib6hZ9Dzv6PfIXmQk/G7mMWP
         aDPIk3ARqrniwA7pubs13hsbMy2GcefyGBuNjCAGmRHdXSQ6D8JezUbHAD4I9Oi3ELvE
         ngn3RJNo0uxTWJ+BbNZ6QerXZ7KMNeJ4XmsHOMrmna4ItlqVc7j0g+eyZz+zUJmMdwze
         jbqA==
X-Forwarded-Encrypted: i=1; AKwUvBxCw3JaEcCd/6df1i78qkUCHDEDqoixw2wvf6HenO7t8g6BEprLVRNMWVoxr6plAg6pHaA=@lists.linux.dev
X-Gm-Message-State: AFuF++krcytbgi/hQ0DxVDsOKbdFyEP/pykdkIfsRqzFtcdwLOcPDF6i
	zKccZOwIJ2UJ/n4JkARUebMSpYYFwxa//9jZoIKU3Gvhi6wbSHIYInIrzeV4fld8Tv8=
X-Gm-Gg: AYBFou0dcOt1+0CvQAwNFBzLdltDBOb8BedtYgvS/f9x2fde+pCBZJPLOLboLG5r4Ii
	1LH57zV2HK6WMY8iNMgFt30dMqgl9xDqiyPb4PIb6u6WiWrhhsbX+ubNIoLqi/9ciQbr/npNWED
	//hnkcbNTZi1jLs3OKa7f7X7zmVDuIUZjrQaZabNFIwelijwlu2jXsuakqBbRORuj2pcibC/R5/
	Qj4aZIhRJxQeSRmjq+D1MWa2iOl+MWWG0wyV1TBzk9IatEH0GqrxJ2ziHXV0HLhZo25ax3GqYix
	gVjZllgXvvBwWQ8C0/wmBAbxeju7jpQD/pqXaVJB95QBxTrakuMgb5nJ3ZOy5ijqcRbqFs5nOGW
	XmnBrzy3VzHN2FZTNtJvL8U2D96ot4RhJrJWffObKEzaZ29DaYLzS3PLMacZV0PJWBgY2a24UOb
	2B4ZEI1hn6k0Iu52rnZxXPZvwaXfD79YoO8giQYPhDGoos242XJyQle93KAEqex3dG2sq1n/iqJ
	I1hBe1jDgsW
X-Received: by 2002:a05:6a00:4186:b0:881:f5e1:6e7f with SMTP id d2e1a72fcca58-886c48b54bcmr338925b3a.31.1790717366754;
        Tue, 29 Sep 2026 14:29:26 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868866150bsm495163b3a.3.2026.09.29.14.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:29:26 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:29:25 -0700
From: Joe Damato <joe@dama.to>
To: Frank.Li@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	bui duc phuc <phucduc.bui@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>, Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>, vkoul@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] net: allwinner: remove dmaengine_desc_free()
Message-ID: <arwttakXqJndFXGe@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Frank.Li@oss.nxp.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	bui duc phuc <phucduc.bui@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>, Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>, vkoul@kernel.org,
	imx@lists.linux.dev
References: <20260929190640.3516766-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929190640.3516766-1-Frank.Li@oss.nxp.com>

On Tue, Sep 29, 2026 at 03:06:36PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> dmaengine_desc_free() is designed for DMA_CTRL_REUSE. If DMA_CTRL_REUSE
> is not set, dmaengine_desc_free() will return -EPERM.
> 
> 	if (!dmaengine_desc_test_reuse(desc))
> 		return -EPERM;
> 
> So calling dmaengine_desc_free() does nothing.
> dmaengine_terminate_(a)sync() will free all already allocated descriptors.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
