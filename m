Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7161FF603
	for <imx@lists.linux.dev>; Fri, 18 Jul 2025 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852066; cv=none; b=bICW0wILFe6qQOmDI4hAKspY0wLo9Fe++uq+acoJhk+j3M2ZZE2EKO5/OqHVoYRV4Iul3SMI+MkoBwfTbcYI7eYmXrLsBoaaEyk7fu+rtu5+Udz+UoghuE0Hme3fIWVJ3Ca6zDY4sWUAxKP/A3MZX2C66AIJIVC+zQtWC9QWfmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852066; c=relaxed/simple;
	bh=E3zelDCTh/t8II8UuBRX1FtcJbTydx6/K8VxkByBAQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRIzlKLlhrhKglUnK5bqSBgBzIo4Ox2fzanhZhFVXyoUFHLFhJXPo0w49dbpSeW/Xv+TDfZB58DDHEqgo+xDShPvhp8sn29V+l7GYhv9ujS1WoOPhS6O/qmTDJTagI6Y0iiQABDYLs3xWvz0vcpKkMyRXFRLHr/UQ5zjNyrUCgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9+T4Yv/; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9+T4Yv/"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6159fb8b2aaso890416eaf.0
        for <imx@lists.linux.dev>; Fri, 18 Jul 2025 08:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752852064; x=1753456864; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYuxKIpCYIcO+gJn+7H1gBQp96uaiFhZpQnHXL5+kYE=;
        b=X9+T4Yv/Nua2QkvuJZdiWHJ2i5bGePWKFlz28ayRp5HoDqg72mFCWFp7UzE0QzgPYd
         HlgN43FzHci2r82FKRrQxRmmfjc5uHiTU4iQGU1QGmWulno+Wsx21/WDS9Dchx0UpTaq
         rXyWxjdoC1m084zBkiWwHfO2Q8DRvRgdSNziDoZHNoP0Tq7Cvds1RJZAvV58GvP45uei
         M/NinjFJSkUgCZ0T1ozqK+95sVRpeimqcta33m/PNYgahDjZK7oHDb8NKk1+ALIqpBeT
         vgs1x6fqkddCu9dqyYayVPqxTrVVBp+oBFid+D3RPCVNPlRD0/zqjFrIA/kn1z/vnshs
         GlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852064; x=1753456864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYuxKIpCYIcO+gJn+7H1gBQp96uaiFhZpQnHXL5+kYE=;
        b=sXgD7ZmCedB6rE1Wr1xbypP+JXViyDY7taxwxUWEMpoWTq8/16JyrifkPY/FO+1diE
         y4q2wQqayiUdSUXN2AWXEdZtYYKCRyU6wP+xpQEV45tiL2mlVfo2/Mx43CvkNU4DSyuY
         rA8hCUObjTUfhEMcWbjt1pYL6o7JLZ7YMLEBU0cQvlHi8xzzW+2klFp6qVn73JhOEpN6
         C1zawAnSlllLkIz01Z+eZUh5dJsVLFjLUhTQfA4xTfB8rzZsM46DAnCYDa+ySCo5iALa
         s4g7NFPsiUPGyymEQIdgKrT986LGSG0NYJAYhbK36FqQhqy67NW3XqxEGZKg0bkLDxvh
         XQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQz/iTev+PCZ4mXLbIIPdwePvf9hOt56zfKD7vkrL9fHnYtlWJsuv0QmvSqpAIE8iaNuw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXOzbyQRs3qYyIYqcit/rSVbSmSDdTI+bcscF7f9Wm9dYv1nxq
	yB7M92lPPeo2sGFHF+D4Mvkx3FEsD/94BKxo6isuWr2kC08egjhCtTdgGShWH93b8Wk=
X-Gm-Gg: ASbGnctNr2v9/mxVmcRndKWnAc7fW207SjDwnKJ09fxNAe3c3mnMsnMEuk7pyw+eMc+
	y2u6mSBVF0zQpggN6KuZsQmyoMgwVLosLbKI/acKAreGSdZhvOADpoViiQ3KhJCewNp7spCW8Ij
	d7E0o0/CE+wXyL9VnYj6vvs8nWfZzvt+O6BzZfKBDjz7O1mxwHaatiBcqFAIy3WX0MGbwZobzQG
	wKWB8Maij6VJmw+2gvIBMLGJ3K9RRGmLm1ARbZaHlRaAPLvigyOSMyvHjUl2A8fqGzSAWzuqfWQ
	OROpH3tKwHKqQrGmFdQFXaXvwkLOzkJTKTTr4f9WAbGDKIjDkKNDfsiUfSDMdtCfau1aaTpzzDz
	7JKtuqEJXBAVbe417cVL/8yIe3QeMOw==
X-Google-Smtp-Source: AGHT+IFHYUOrLnCL26v1j/YOSaFa73FuGV6iSj194qbCo/8B+uaKvogFvTM462nA+ygYaDPEodMSug==
X-Received: by 2002:a05:6808:1301:b0:406:7704:b2e9 with SMTP id 5614622812f47-41d036ec35amr7991928b6e.9.1752852063904;
        Fri, 18 Jul 2025 08:21:03 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e5d3:a824:1a57:fcaf])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41fd5951f20sm458273b6e.44.2025.07.18.08.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:21:03 -0700 (PDT)
Date: Fri, 18 Jul 2025 18:21:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Xu Yang <xu.yang_2@nxp.com>, Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: s32g3: Fix whitespace issue in device
 tree
Message-ID: <e4c5fe15-87c8-42d5-b4d7-09e3d1f7e712@suswa.mountain>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
 <52960eb1-4432-436b-89aa-d50fc7da2c3a@sabinyo.mountain>
 <95b3a17e-a5a2-4d84-960c-2539af9d5450@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95b3a17e-a5a2-4d84-960c-2539af9d5450@kernel.org>

On Fri, Jul 18, 2025 at 08:58:19AM +0200, Krzysztof Kozlowski wrote:
> On 17/07/2025 00:46, Dan Carpenter wrote:
> > Checkpatch points out that this should use spaces instead of tabs.
> > "ERROR: code indent should use tabs where possible".
> > 
> > Reported-by: Xu Yang <xu.yang_2@nxp.com>
> > Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> Patches were not merged, so this should be squashed there... or you
> meant they went with Greg USB? Then no, that's dissapointing, you are
> not supposed to send DTS patches to Greg's subsystem.

I worry that I have accidentally stepped into politics...

Yes, it went through Greg's tree.  I'm just using get_maintainer.pl.
Looking at it now, Greg and linux-usb weren't even on the Cc list for
the DTS patches.  There was probably some b4 magic which let him apply
the whole series.

How was this supposed to have worked?

regards,
dan carpenter
