Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C744DA535
	for <imx@lists.linux.dev>; Fri, 25 Sep 2026 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351865; cv=none; b=g0F+vlY+1XUqNr/iSn11h23hXeNpfVdrJBGdSw3u+zle4oZy5GPBe3YpgrMMqnM5xV7gEfcTgSfk2YmEYi2QklBSwp7uT0eslHYJt/Xr3Z4HrWluwY80eaQTof50p8XK+hEJhLMj72XXOTlXcDP9wdwSs8OZ/YbETWJRn0XCW5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351865; c=relaxed/simple;
	bh=EDelbTNsLGwr16sy1/ve2CrvpZJX80YUMKX0NU3F20E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMyI0zZdf5jq2xU4JJ+z13IkxoKPkE/d/r2fTApkLjRVRz7nu0VXe1NZV2T25MlAYlXgfBcZeqZ0YUKlHNErg4njZ+fKdzxFCGCAmcFInyIDiuAgJCXR/UfqZYS/CmbOZ9XcrCBbLUvLGCbCv9JHzqqh/9YgA0isHkoEjWTM0II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vr2RuAQV; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vr2RuAQV"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so635006f8f.3
        for <imx@lists.linux.dev>; Fri, 25 Sep 2026 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790351861; x=1790956661; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JDj9ZLoDuXLeZ+ESPsWzwz0ze3YEaXzdQ65mT9PQEa0=;
        b=Vr2RuAQVVM9yd0BpaX9bHrbJCVIDmB7vBBx13OoNFSiPg80vpphuF6/XGOR1O6I0QI
         1BtW59HpBQDUjWsN1PMMkKBWY3bxpO+QqcbmuSpU9l0HXksCUaiJx4EySXYdkudLkEsF
         t+HbTAWdgIsQlyQfiiGIgOe87RFKKMobNfFUzAkwO7xIpLzjZX4bEyh8xsLcVQMqsKR3
         1LTFZZxT5bSw4bVeyBnSkr0Zb1XbZYrxtsbZqn58tSetimKA/cyQE2u3paHkQZDIbvFl
         bXp0u7zpHGYykZ2TGxstR0ey+P7hzYYqI1ft7OLsBzTZBD5rRLK14bO/p2lasgFcEiQW
         KNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351861; x=1790956661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDj9ZLoDuXLeZ+ESPsWzwz0ze3YEaXzdQ65mT9PQEa0=;
        b=cb3LFQ7BmFHj0Igzo9dfTt7qf0Mz2rNUXp65sSaHzVFYQn5OPKlKk292SoZP3QDNg1
         a+WeR7XAAL8F4Z45vhiRPJ65ywuORkJq0lQnteI6SKroxhSrYF/BPwbI9X2jn/NJRNHb
         lagQ1fJF+Vw4b+OX6HpC4KFU/bK/DTVovDIYqTSG1SQwmW+HwMXdpbmi5+tWAuoaIgU8
         IuXweCr62jvyfakV9RAJu+vDlfGl6hPQDvV1uDvpbPetRQnBVoqOKI5sXEilr5582+nl
         mWuFknaTNfUOXq6xN2wlFvOOcrJuphbrp45NzM8hEevYBzW0f1rVNmQUPmmg3TGbQnLg
         Og/A==
X-Forwarded-Encrypted: i=1; AKwUvBxK33+dgZZ/BGHp6683XBA+WKpr2f/8a3rCyA8dYvm8S1S8pGAEKBQoBnGwq+akEWmVHaU=@lists.linux.dev
X-Gm-Message-State: AFuF++lknYdNJESLMNJkoXOq4SFw14/0ppz58RXqCFuM8BmyQ3tia3sA
	zxek82n0hH1hD2wg4fy74/oJIoI50xcPniVDSsxnrIjYzaQfE2tuH/Vc
X-Gm-Gg: AYBFou2ClUuJ3zN2J/lIOF9WJKBWdPK8lcF/ig8QfPpQmJOL53xha1Tqwm2DB/fJbMC
	EyapOzcHwhnWc6eewWu7VwVwSyL3qbdi2mM5m9TkZ5pYm9A3juo7zB54N6l9Gln4qBGZyAaHAID
	R6Wws4o9eqw/JTsTtK7Z2QG8lSpAZDDbU6P5+KAN4T7rdjWX8UkWduoikaNR+6yDp4WWFwaTIGZ
	Wh23AHBnuCKELFM1p2/Gd6QA9yvpGm72/rU0X0SO+6atTGiULYYOF1NY/9ygY3rERKd/nsaIab3
	O0PqbDWCpUut56X+T3DfIy547YxoBrxeP9rV8VVH7kkY2pyOT3bqFM1Y/y1qJIH1NwdXpl2vbgN
	U88OK9c3uIe4HPI2tw2OB9A7K56vuu2oWYXSbJpByUedpK9lKsBAV0lyE6sxEO6lIe3CurGT0rq
	42WdyNgN5XecotPa10uuNTIy24xOhZOznw1ATHLxbf05kFUQOWuC6EJPvMe+O7sm/S3ADFR5hzm
	Upq0qzV6SHw2p86WIsF1FsaHPUQYX/CEjslxu28gUI9Ti6a3ykoNFkEvDyvESh2Dyvt72VbwOpG
	3uEexpk+ikhu0hNu7EgATHobF4G/
X-Received: by 2002:a05:6000:2509:b0:487:27f6:a4d7 with SMTP id ffacd0b85a97d-488716b0361mr12527019f8f.39.1790351861320;
        Fri, 25 Sep 2026 08:57:41 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3627a8sm8964225f8f.23.2026.09.25.08.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:57:40 -0700 (PDT)
Date: Fri, 25 Sep 2026 17:57:38 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v1 04/11] ARM: dts: imx6ul: Add Variscite audio codec
 files
Message-ID: <araZ8pJGmDVXMjvE@Lord-Beerus.station>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <ef56f98137eb9d1e0af3aa1b801186d829dba521.1790344389.git.stefano.r@variscite.com>
 <araMJFirhP86Dcb6@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <araMJFirhP86Dcb6@SMW015318>

On Fri, Sep 25, 2026 at 09:58:44AM -0500, Frank Li wrote:
> On Fri, Sep 25, 2026 at 04:02:21PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > Add separate DTSI files for the WM8904 and WM8731 audio options on
> > VAR-SOM-6UL and DART-6UL modules.
> >
> > Put each codec node, the SAI2 setup and its pinctrl in the selected
> > audio DTSI. This makes the WM8904 option explicit instead of placing
> > it in the shared module base.
> >
> > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> > ---
> >  .../imx/imx6ul-imx6ull-var-dart-wm8731.dtsi   | 71 +++++++++++++++
> >  .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 88 +++++++++++++++++++
> >  .../imx/imx6ul-imx6ull-var-som-wm8731.dtsi    | 71 +++++++++++++++
> >  .../imx/imx6ul-imx6ull-var-som-wm8904.dtsi    | 85 ++++++++++++++++++
> 
> what's difference between imx6ul-imx6ull-var-som-wm8904.dtsi and
> imx6ul-imx6ull-var-dart-wm8904.dtsi?
> 
> Frank
> 
Hi Frank!
Thank you for taking the time to review this huge patch.

The difference is in simple-audio-card,routing:
on DART-6UL, the microphone jack is routed to IN2L, IN2R and MICBIAS;
those routes are absent on VAR-SOM-6UL.

Best Regards,
Stefano
