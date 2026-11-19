Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082311;
	b=dfJN/eX7NmsklarjoSTk8bS/J8Sd3zS5nEV79niQuvDtqmCaSV9WMPu0LPFxvFCVsuQ2
	 doxK2nKntw14Q+5FMikxk7k/NTQ2b073XKqH7UaYfvptQ0N4PbxaLiLaQeZcayPU+F2j9
	 qPJ5LmEG1zr6nx2oIXdMoxvFk1V5Xl3J3gLPPqbllu3uGcMu1bJZQKYjM9aFll/Tk+qAK
	 swE1ICc/TciZbh8Tj9GTH45xcz/jz9/lW5JbIBfNTRwhgf/VNpqs9DwXuW7+zn8faqHyg
	 ryfaSVMXvKgIMDSiQLCLvzSc7M9ZRRkEod3t7EmT4hU2SDsvOcAx4DbS9zD6qPAYKiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=;
	b=uou1+R3x3mlfC9nydtMBRpNOTt6OC1Uzy6btBUk61RbmGQEjeYlNsGKXenh8Q5UYqf5t
	 gkt/2x2nOubI2vq67SL0C9mXWYHbS0jl5pdg0X0iVPPQD4kT0utv5DL/pXdaRt3+o7xEx
	 E4Zwd24+jZpU0hHfdJkuWmiBWij9d6IcSMGN6kQsqKFtr9GMfYMKrZOQ7mUpHpQfJjc2k
	 HrUvLqeWyR4HFV7kIBbsY3k6EuROXgvyUD9bdOfi/Zgk41lWHwtAQAqyO5xyLl6vxh2Cj
	 NpYFqKpLkafxKHVLE3Oi8xUwoNKb60W5VT6/XiQFTHE2epaOqVgB3LkVw4vemKg00Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GH59n0jB;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3590060A2601
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3590060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GH59n0jB
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso15406145e9.2
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 01:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082307; x=1795687107; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=;
        b=GH59n0jBE6ud4hKeEIKL+FDi3PVRf5+f1Rc4T37UWGHnpfzHA7toJfr+ws9D9I2FDs
         OiugteWws2f8ohJwTEDtOlaWEF62wymBf69AaE5HJSi7UT5A3eFtmZMaUqPMvEIQVmjp
         wKZ0yAh/jQVqgLoHQK4tyEiAfU2J1Ckr/X/ByH0s/0+rmauZkJUjc39aRKleMB7k7Uzp
         XKwBppBgCo/vPlIbrVfOR4dN1MSPlsEYG1V6K0vt1LWnAmq0f3TPJn5TxBCNVjzoR7+I
         87GQ/U+eRpCweo7ZJEg9TQgWwuPKcU0WqBOPCdrtd00eHVQVFFd+fiTuvmZh5FKkftGT
         l7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082307; x=1795687107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=;
        b=BS5BM116OZOJBsceMTPJBd5m8BDrIoU1itZBbRLCZSO8fY87AkqdznZ4JIUTqhZehB
         u9ob59VlCNGeLwjyvbwYWKWudDdQtWpZloJfD8tNAggwcEdwD2j1NXsgHf9fRxQJ2KA5
         7R2W0WqZgtW20m9Ncke7JjLD6JkR+8AnYkzbijOYeqTUWHG9XCC9pMfvDh4SKobazxjG
         MGVpXwj5gMALV/rW57ttIZ6JXkYD70kgE7FzlZNtkV9v5zMoorCuKcn4xj2BxqF8nT2O
         odNVZtsSKOUrxFXjdUF28hPtuHxqYmSfxUNRLWY0kYiCAnMDFvQ0qU9E716sJM6W8i81
         3R7w==
X-Forwarded-Encrypted: i=1; AL+hErFkkJVBRKcx5jW4xjQo/vuG00ZpCnSpOB/UfK/xdK51sNBYNRUILBuYdmnyXcW8pDnns10=@lists.linux.dev
X-Gm-Message-State: APuU4Z9m/LUq1OXc73ad/Uxdh2HCXWM+EBcmaMeUt7DITNS7ZlY41QdH
	gGr0o5bA5IvXekbATktL5tPdnVXggoGjQ4Tjf1bPoojMpIwUQbasn/eD
X-Gm-Gg: AYBFou1ASS/CmtnnbKp9Z2s5FeCKe3WBJXIiwYdX8nSDJ/+UqLFxjtyjgb/Ii3eihjB
	kR9yXIe2Y/tIURVqXOQj6ZZYIL4/Ljt+T2l83lmDvTMY+rGgTa5Zfp6ffFRavIsGfQhxJ+Bw8Mi
	V9mg7eR+/dp8D3CtlWkHRHErRNA9n8aTGOEkXz1Vh0YCHi1qjzhoD55oxoWa1TZ0EXu6X9qRSqM
	l6GHSRY9YxnPKXMXtkCLN0wglIhNO7jMUIApoQ2d2ORXNycAZF7p6vX1YERu3Ab7IwWtokneFhH
	yw8k/RggKT8VzDoNe2FJYOiIW13Rm4ma6uDelH/tXFQBxdgdJZ7b3AjafVAwkw6KUZ6OFwJOFNt
	ixJD6RtZa/7G8xVAC+MbGIuMtE+6Bdv73V1WTUALaSJIZezatg/FBeXT/KfEQ3K3bkRV35cXotQ
	gz4SX81qyUO2UwQrb3NvvEfQUyx/fHuAkk/J9tCrqoEFkXgaEexeuxy5fbhfPHeL3cru3gDln5Y
	DpxZ2wm2mdmxtp1E2zPpJOy0TSe3E9iOHhryX9M/+Yprc7xQjOjpflpHp73K3OXbXO/95lWWc+d
	Tsuka2bgmmUIuk3ackK39yoKc0InsMhNNiptIMrinCzvxVnhF5A/Wlmnv9ytKup1tA0JFGE8KkL
	TCw6ZatZGeXKmFvYunp5sLHrL2QLLc9wo8v4OhOfwbLdAlq3b17+vnThUfxFkeA==
X-Received: by 2002:a05:600c:3e0c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb7da458eemr109808135e9.28.1795082307133;
        Thu, 19 Nov 2026 01:58:27 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b1ddsm9462578f8f.28.2026.11.19.01.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:58:26 -0800 (PST)
Date: Thu, 19 Nov 2026 10:58:23 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Message-ID: <av7IP7M_UAtYFm4D@Lord-Beerus.station>
References: <20261119090600.9257-1-stefano.r@variscite.com>
 <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>
 <av7BStmo7w4_rPci@Lord-Beerus.station>
 <4a4366e3-a99d-4250-9fb2-c3eb254c06f4@oss.nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a4366e3-a99d-4250-9fb2-c3eb254c06f4@oss.nxp.com>

On Thu, Nov 19, 2026 at 11:42:54AM +0200, Daniel Baluta wrote:
> On 11/19/26 11:28, Stefano Radaelli wrote:
> > On Thu, Nov 19, 2026 at 11:18:45AM +0200, Daniel Baluta wrote:
> >>
> >> Use "reserved" instead of "disabled" for all the nodes that need not to probe
> >> on the Application processor because they are used by the M33 FW.
> >>
> >> Also, instead of disable in the commit message I think it is better to say "reserve".
> >>
> > 
> > Hi Daniel,
> > 
> > That makes sense, thank you for your review!
> > 
> > I'll use "reserved" for the peripherals used directly by the Cortex-M
> > firmware, and keep "disabled" for devices that become unavailable as a
> > consequence.
> > For example, Wi-Fi cannot use its reset GPIO because GPIO4 is reserved
> > for the M33.
> > 
> > Does that match what you had in mind?
> Yes, that make sense. I wonder if it is a good idea to split this patch
> into multiple patches each one representing a logical change.
> 
> The commit message suggests a lot of activities going on with the code which
> makes it harder to understand. Either approach is fine tough, as the changes are not that big.

Thanks for the suggestion. I'll split this into two patches for v3:

- Extract the existing M33 configuration into a common include,
  preserving the current behavior.
- Add the M33 overlays and combined DTBs, using "reserved" for the
  peripherals assigned to the M33.

Best regards,
Stefano
