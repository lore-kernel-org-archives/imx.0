Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50658175D47
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730558171; cv=none; b=dM1X+a6P8j7a/qKOSPHp3AMU8Otlcb0dXpjdTYQr/Bv1gi3oqvbZVJyEX4vGsELjdRtdT0yZxQbxHzmsmsU+GOm+K+LV2Jkh4Lw/YGIdGBSIzXT/ErIDWholGU4CYCHYQ2xaFu68rGPrurpAG6sXJE1VXhvLuvuVgaDlzzpwGco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730558171; c=relaxed/simple;
	bh=jen3Fr+N40Cko1laLEWb06nyy02f9b1SKWGey5w+uQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLendk6IpZieeszz+27ONAnftrKLiWBCs20YqdN9X1nv5pBLXn8AUCgKApcv7h8Ggk8AMNwkpwS3J7iooduas1d5Nsk2Z8nidutpL6pZJhIICqE8gcdcgnh6qteRJaWmqSmL4sswVRZLjDSfhV9wj9SQzqcfsfDOROk5zkUjhSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNWu/zWw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNWu/zWw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4319399a411so24040805e9.2
        for <imx@lists.linux.dev>; Sat, 02 Nov 2024 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730558168; x=1731162968; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r2f8PcOKU/FF7Pc238+N7r6RVxJuBnH+dra36GzbN3Q=;
        b=LNWu/zWw2hQeuYAP0XoaSNc6sww4FJrTt+CspA054KFGJ1XJb8h03mXcEiVgL5jSLM
         BYNhaR3g4C+SjUEG1fSxImGaTuJS5tQjIG4QlgLBCwN7Wz44i5HP52QgY9WO3Pq2KmQD
         F09V9Cf7U92T0i2uSAP+EvGYVZFs375Z3ePODg6zEUtoyTjMLqMvfwyyS39n/x8HiQDX
         rZHw0KNbm8VgrkKgc2nXFBGnzTYQDZQmCyH7b1pAWQn0tuxGMAC0mZ979aKWzmJyK1uz
         Mwr1I8IMB892D5letVRdvhePJR1YfEF/BY7REUGAf5VCVY/0g0u0dH/915yYwlKpUt4p
         jNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730558168; x=1731162968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2f8PcOKU/FF7Pc238+N7r6RVxJuBnH+dra36GzbN3Q=;
        b=ev0YlyZb5vYhXAXOrhqAaOuMZluzXlSieyFjt0zzFQ/Puj8HLHSwRJaKCOiKV4KuE+
         cYi1Np7+mDLbp2mLuQiRCF4HSPHZ3GZtxLQXuFoGRHhCOIPZC1Hzr3YoujPxOUVaRNid
         aszQQfg5Sbk4EPhk9/zyCkFavcMkz2dcYChUiq5g0zyGwcTqrIuypVAmr7bmBpZnRjSb
         znWmHglMqnkea9Ud94MbjMsqJM7ZhYthu23gc5sTTqXw06oTN+TQDfEzsVEowgnWthu0
         nzgk8juJpofAhn+wpbu5gjoE7sMv1qEGxNzYwUWez1fv0tn/n7hzGGXpK8zZ98XVFsNx
         fnWw==
X-Forwarded-Encrypted: i=1; AJvYcCXgmdSIJp3zdtZq4qsqaaayX7WgwShJVFbRIJBucjoNFRU3zB/jqS5uN73zAwx+DSekQL8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFNDDzCMNEIwQ1YDdv46V55sGSuBu/dtworvQzM2+aPdhr/bTp
	RPqeAqXLstxzyVn9SicRNL1suzCH4EhENJUkwbaeMWqyut6fcYQQ
X-Google-Smtp-Source: AGHT+IG2ZwFxftz+i126vYwTLkOIpd6nzrVgPGTfjFmQz2ucEFkNbpKfCCu2yMagL13buIP7HKDmjA==
X-Received: by 2002:adf:e28a:0:b0:37d:45f0:dd0a with SMTP id ffacd0b85a97d-380610f2a9emr19284579f8f.1.1730558168360;
        Sat, 02 Nov 2024 07:36:08 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:492c:2677:72f4:9f57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abb5sm8202298f8f.100.2024.11.02.07.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 07:36:07 -0700 (PDT)
Date: Sat, 2 Nov 2024 15:36:06 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	elinor.montmasson@savoirfairelinux.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Message-ID: <ZyY41nJY9ghwe-Y4@eichest-laptop>
References: <20241030122128.115000-1-eichest@gmail.com>
 <ZyXTFhEm9UCBii2c@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyXTFhEm9UCBii2c@dragon>

Hi Shawn,

On Sat, Nov 02, 2024 at 03:21:58PM +0800, Shawn Guo wrote:
> On Wed, Oct 30, 2024 at 01:21:12PM +0100, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio. This
> > change will fix commit d469b771afe1 ("ARM: dts: imx6: update spdif sound
> > card node properties") which moves away from the old "spdif-controller"
> > property to the new "audio-codec" property.
> > 
> > Fixes: d469b771afe1 ("ARM: dts: imx6: update spdif sound card node properties")
> 
> It doesn't look a fix to me.

I agree somehow, it was just that before the referenced commit our test
succeeds with the imx_v6_v7_defconfig and after that we get the
following error:
[   24.165534] platform sound-spdif: deferred probe pending: fsl-asoc-card: snd_soc_register_card failed

So maybe it is not a fix in the sense of a bug, but it fixes the error
message. However, I'm also fine with removing the Fixes tag.

Regards,
Stefan


