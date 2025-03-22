Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7BE800
	for <imx@lists.linux.dev>; Sat, 22 Mar 2025 00:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742601636; cv=none; b=AvZPk0Xux+Wo9ZEXsybPwOB5gfbOWM0T8ethVAbHZVYbgYbec+0CTIVECuKam2hZkjcAA3xC9o2r4S6dHOLip6cmDJ+5xEW1shokuiaEpoTmHS+wu7Rs8Chwk7Kd1AvD+Qo57PDBRFuYtUnhH+nqOXjNu0EcV8ZhEy0tlQonQ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742601636; c=relaxed/simple;
	bh=9nkuod8/Dnbh5yTJSbve8NQJf6vSO9Dh3fIlEmHv/Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnLIAXiJCcAzcLtJyqqkVo/RSxNHG1SPkFCBbFq4gaUHpUgscHPl2A2HoerQtH9u0WAdWIBaIN+p1xxbABwuJmj6WPEZRholnM3nuCKF4hg0uJcYe5/O+Q1hIAsTaKzaOaUqrRMXKUxMIn+JuMsfOGw9heg5+7FEOB5Rgrqcz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/YBVwem; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/YBVwem"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22349bb8605so59581285ad.0
        for <imx@lists.linux.dev>; Fri, 21 Mar 2025 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742601634; x=1743206434; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0bz72reqaQ/H0ufrjl/XM53e5Ks3hOCkEwgmqzh2C4=;
        b=l/YBVwemilkjVuoRoiwpIiU/yyUn17+lmu/2+8NVyBbU+p/VY1UvVSlMaivUrZY3U4
         qWPEOyo7aFoGBwO2yjftN0t+WnTJl7p4ejyAguJf1x5OUNX4XjLL4iUZ6xLcpZhfz1at
         syll9fvjZpbkrMPlrOu4ygvBup7gHGa8VDi4UvCESPI/iP/YLSxqde6Z89HkrdvH1OTu
         SQ/HyeOfVwjKSjNApxGnLR/ThwludLtH8uiy8B30QLyzDjN2J5IPjWjQXAtDGp9lShZt
         lMqcIuh/YeDfe5lbx/lyZOIzlJJZcSeloCz7VPL/NWMyHEykYyFMRN/Iy+IOFSfYC/As
         OJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742601634; x=1743206434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0bz72reqaQ/H0ufrjl/XM53e5Ks3hOCkEwgmqzh2C4=;
        b=tRhxMbIgKTyD6hz1nNehaQ0jYycCn1TWrHsWrXEwbAa+U3oxghDaxVUhgwVfqYXLhj
         JluVzEQRZQutd8Ox79+ehVoXIBbM3Ee9z9ScdKuJgAQzwoR2KLzbdKr+PbxqRlyV+yxo
         dJug6ubemSDNOZUOvt0BWS9C9eUCLfX0P45PmayGH1fGR3onvQCODS0vXC4F8SEHosLp
         zGwHYEvsMfUXUwnUOTB7VsPU9r8gi3iS9CSyDmVUB/99+E1n6vzBYK9SMtUC3yA5fMKN
         Oi/rluVQVGnZEmMSK/p6At0BJFAsMNKl5K4vfG/Ss2o1cX6Cw9mlTbRF9KFJtMv0VC9X
         8Lrw==
X-Forwarded-Encrypted: i=1; AJvYcCXxc5SC87PdyVom7lJOgBZy5HWfLfhc+7jRQ4yidXCXJ8dA3z3Qy/aSEmRD6MfACvMDQrg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq9eBkdP24/y486x/6462PyBHCYNiw0TMPaYpPGLQjZGL3orq/
	PgQYPRkEfiltBSieHBiVGoK53ykFBatHiiudKlESUAO88L1FFIMs
X-Gm-Gg: ASbGncvKUMcaYHeJtTGkAqDqxxLXd1nduVdFrubmBvSi95bhC9RV0PeJnFpwwrhUpPR
	7/kUpAVkwpK+sHhaRj5tmDNBYq3Oy9KJvc8zHI7AjpcR9ApydCANz7JDDsPTK2dm15/JHwbasXP
	zBtBdK4U/b4FRqNbbDZw8K/nxyX7zVaYrt4WMaX0upI5G3O5/xQjYUJbdinVVvqy+IqQPk+ultU
	BrO1w56EXZzs0McFQIfQ/cqgphsSF7g2TI+VMNyPdeHzi+xTT7j/ktPlBt+aVOXQuTUSD4QNsYv
	WbU4wKLPZPSSekFJXZMtycWjCqJiT6hjhlXpeH29HMRxqvvbnDJ65UXTvA==
X-Google-Smtp-Source: AGHT+IFj0ZbpdzJ3fOyHNqk79NMnaiYgxK/9tCAa9k8zoUUAbUTFn4ESNw1AVqIEpEFRcJAovc328w==
X-Received: by 2002:a05:6a00:b4e:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-73905a2300cmr8976502b3a.21.1742601633562;
        Fri, 21 Mar 2025 17:00:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906159f8bsm2697861b3a.155.2025.03.21.17.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 17:00:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Mar 2025 17:00:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
Message-ID: <cf20e703-5770-4bfa-bb5a-a1f5f03f56c0@roeck-us.net>
References: <20250321143308.4008623-1-florin.leotescu@oss.nxp.com>
 <20250321143308.4008623-2-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321143308.4008623-2-florin.leotescu@oss.nxp.com>

On Fri, Mar 21, 2025 at 04:33:06PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Introduce yaml schema for Microchip emc2305 pwm fan controller.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied, after making the changes requested by Rob.

Thanks,
Guenter
