Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A8019D078
	for <imx@lists.linux.dev>; Thu, 10 Oct 2024 17:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728582171; cv=none; b=TAs5JbKdKSHJjgThyOVP8QENMiEGZ69tlJ+M7UIeyXhdxAqB5DOw6QtK3RbKbszM84jxOpQghxp8YsEYcY6WJErn21VbKzcl2t+ZIo5AoJ9VWCNf4VOe0vZqlEF8FNmjNMbXkZEfffuPJlOPguKZje9gQ+cbBllN22z9hcEKpBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728582171; c=relaxed/simple;
	bh=r9Y9dp0ia21GJKEJhhjl4hsk6OfUJQDV0li1hpz2F4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8d0uDDMpGXfe9MVEyM/XZ7Ij6pvTT2JHGxOAV3TyfakQvSWEtPDRWKpl5yGNo5A9pIXQLqFKegydADhRDRMixR6DdfP7mrip8XmNObDrjV63ZsKDINRcHaDdlEzOglqN4jUP1ectHzWb6XjRVw7ZJkH1JIIBIJwWfti7WIR+Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVttopyC; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVttopyC"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e03be0d92so1037268b3a.3
        for <imx@lists.linux.dev>; Thu, 10 Oct 2024 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728582170; x=1729186970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r9Y9dp0ia21GJKEJhhjl4hsk6OfUJQDV0li1hpz2F4Q=;
        b=jVttopyCIi282e6xi79z1a+5dxTTsZ92c/Ka4CYaKfGqgfFpaaY3gjk0yt84G55Z6f
         D0ajaIeJvSTOIefCr+DtkSPI4FqmuqRIxNCHnzwxVincOskakDttL1RTXy4GuwUEVGn6
         Dgy4aTFTUnLsgEEVTCSFCj9JHNbm8ht8iomy18PFH6zzr/MpOXVy1tThlZ9f63izAyFW
         1Cq8uAalEn2YoS4hTNTyKPDsIShx2/8ns4lVwp/V/xJUmZMvbJOAseQkc8qO36Lmxl2F
         6xXAQYlV+VHyQIpzRf24IfUSYEJHp2HSljIW5tyivyRnPpi4QrIkykcCYH6xMMo5C78V
         8/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728582170; x=1729186970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9Y9dp0ia21GJKEJhhjl4hsk6OfUJQDV0li1hpz2F4Q=;
        b=wfwMB6rSsM4jdOpSM5/nQjW2FZlRcREY2o+AVx0TJhlh5GI40hEA57pYCVcIs+Ixtr
         T1MjOnUhGBtb3Q+0+Qt0LjX+SOhQX9N7ohbUK90dAaL0Jy7ucadfGQhCtIkAjffVo1Y2
         1DRlMy7ko7ch31AJo4tynX1it99DKsUuYTYQXz4YdPY4dg3h2QHafVthUFVFd2m2btM8
         nJ8tGHsguT9LD4mFD0SbZl5UKBtdNQ1HkyuO7Ly4krdOXBI3l6IYMaL2SwgIm6bouzTt
         9+8uYX2dMwavXCmlBuubcLuzW1NyNP05usEDOQ6vDHulRDmwXpNOvG3Uf+f5z/1bdqz8
         UbwA==
X-Forwarded-Encrypted: i=1; AJvYcCV+/hqx7OJHZQ4jbZ/6aoZt3kfUCbLFsSWN0mvDQ6SWjxQlVU0UMHcNvY7/hW3PeMQklXg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKmlmTAkvPlpM41cVQ0AWLS2O+FHrdUEMedAW638ePobi/LSOB
	Tvpa4ygehi8Ke0kLGQ/yRO5JY2MGg0RGQckvAiPoFrI3UZJQTGrx
X-Google-Smtp-Source: AGHT+IG/bt6GaqrKZX93wp3w6yysAt6/pJEYER+jwtjNsIXy4062y+ky3XgGBO7Es//CJOF0hXDglQ==
X-Received: by 2002:a05:6a00:1312:b0:71e:1cc4:2754 with SMTP id d2e1a72fcca58-71e1db63eefmr10819173b3a.5.1728582169664;
        Thu, 10 Oct 2024 10:42:49 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9e9843sm1287240b3a.24.2024.10.10.10.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 10:42:49 -0700 (PDT)
Date: Thu, 10 Oct 2024 14:42:44 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH v2 0/3] ARM: dts: imx[6qdl|7]-[apalis|colibri]: Update
 audio card names
Message-ID: <20241010174244.r4sjlapbw5dhuvag@hiago-nb>
References: <20241010171128.107819-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010171128.107819-1-hiagofranco@gmail.com>

> This patch series update the audio card names for Apalis and Colibri
> iMX6/7 to match their specific SoM names, making it shorter (less than
> 15 characters, as shown in [1]) to fix warnings related to ALSA in
> Apalis iMX6 and Colibri iMX6. For Colibri iMX7, also do the change to
> make it compliant with the other card names.
>
> [1] Documentation/sound/alsa-configuration.rst

Related ALSA UCM PR https://github.com/alsa-project/alsa-ucm-conf/pull/448

Regards,
Hiago.
