Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391543A5452
	for <imx@lists.linux.dev>; Sat, 26 Sep 2026 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790412057; cv=none; b=X/DJrennUuwXn2sH2zZ6QiX3HIl9hh1IB5GkZCh5ZPlg7+6m7QVzz8MOx4KP6Eg1yxUyrDPfg2AoYU3+lgD5nRdq4vaq7oGKxsnm+33X58W8yaeCatKytlNO61ci6INpSWAcxEgXpSk01ayNN6uKlZGvjsjzVkcq/uBfrykw/IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790412057; c=relaxed/simple;
	bh=yfJjADf/hO1fRxYvy/AN/v3SrpzC/4Wi3xAd5XT6Vfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHyubQEg+wFfQ6odGvN41YcU1AcVFxGRyeRL9n3Q8LauE2VLl3UfuNAs+TpIEtw092yt0LxEIuwziYPITk4PQ3IYiLcm7OEncB3ZQKlVd0mCceoHeKIRlQNV2pEz7wfP/akn4oAqx8GIYdR1U4E0c9OcAPwt663GQesZEbq/Ypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8dqUqfB; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8dqUqfB"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so879810f8f.0
        for <imx@lists.linux.dev>; Sat, 26 Sep 2026 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790412053; x=1791016853; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKB7jX/87a5ucU2dpPAfqks2hCkBhkpECERSJJpQMwI=;
        b=b8dqUqfBaqBPXBLtXGVmUNRvnf5kuMus/4+1D9oIRVRjLAMAalABYTOaWnSRj3t5z0
         1737pWRQaImaLhRGxPWFbUPXVWJ8gNVZDYbwe+QYJD9REvHMwJ0Ha0smipC16Q6UxZkF
         qKH/0JxSRoeacYuNkQp5lpLCV6bZXzi1USdqpjKcPf7npkcy9SXBP/t/FPhguVty9IT9
         xyIKKD4QrvPBWjcof+vg9fONXl1Byxo+vJ85RTcddCedluOc3ARv5oPwulhOaBIFufSZ
         1ZTIRxGJTAvODmH3tP3ufFQ/zRCRu//o0D0xLqHsMApisAhv2bul30ACxQdD+avH09nD
         m0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790412053; x=1791016853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKB7jX/87a5ucU2dpPAfqks2hCkBhkpECERSJJpQMwI=;
        b=njRfXGl4xuqNICZV4+66G3epqKLnXxRI/dyWD+FOwg034UlgIPyWqaIDFugMi+fDW1
         Oy6g25g2Hq6DzWKzSkUzuql8j0Imxk0MUbg3m/pakVgiIlSNLtWr+TsZGz8R8nuoPljp
         f2fM5Kpyi9v2oDwrQXg6o26/qBAyM0GWsTIcRya065Swlq/a6GpyYLGvw85K2bUrPjtg
         plH7WGOf4OtSgiwe2/hNuleUBOMRixdK3VWSK/wNhQX5SHUteMSaPGRF6kNDmkUAjRCN
         M1GLMO3RVR2cNKfINDQF9deOiN8NqBIwaWw9dWClpHZEN+J765dDeKQIzeUu1MyF6Qid
         69Hw==
X-Forwarded-Encrypted: i=1; AKwUvBy5tV5YyPSD13lkqeflEsY7N/2ahqX171cXFLhh9yOrC78vQDjhMiHcbySk+FJvZThuA1M=@lists.linux.dev
X-Gm-Message-State: AFq9FYIM1i4tmSZxNYKh8/Euw3+59I1F5D3Dy32guQx5aGcFN3RGIOOb
	AD64CjRpzBeVkfdwCjAep542D+BfJg2VKBakX9S7ceP6HHRLX808vtDl
X-Gm-Gg: AYBFou2TcwILqdUal6kd3obATU+PZ8QzZA/B4xH8KM3PHulW4XS+ihKG9LFNWXRL9Q5
	C+M6sQ3faDcfWCwKNUQQFHwUG81OzV2LupdK5TTWwWhNRNFkUQeBrkVK1RhxdxbDvYO6KSrC02h
	Rih6c+u8LDQLdyz4RXRaDHhOgL/x+R/8ZPk0XD/+91cVxkdCgwpSnLZhWoXwflVYocw957tyiVU
	PPeVM7fmu56C9EX40bBemJqLb40uTshFoj8dERhgRGCZIr33F+PQvfZ1YbXXE5npzyA4X1SS76K
	Wj64nd7gGfBX2ErnUrph4gZcs1XytFr+gA9zJx5Ejpocmrdboty7iGz0h1LTq6HoKZ+IMwGbAGd
	fzzRp6OSdRB0cCCTNxc7h3EFt7zDSQr3vXd8O1/ZNcmmv0W4wUP7G5N12ft8434fL7tm4EnyD+n
	3nF06AMrPEBzu9vd76hyE3clgLuaHJjfwcDS1sfAUQYvBaEyEi4s4nMnshywBc/AjfAzoYzfzsV
	2ePRQkJzgve+4lyOZ9VVU4jPnxk75a65eUnNmjZWxFhQxXZlvdI8VjZKoBYkV25WIX6QZ6hRiEy
	XOprzvF/NeN52LJ+SwTLUUiZaRBx
X-Received: by 2002:a05:6000:40e1:b0:487:62d:37d9 with SMTP id ffacd0b85a97d-488716a5e3amr14226748f8f.27.1790412053273;
        Sat, 26 Sep 2026 01:40:53 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349a0esm18313534f8f.10.2026.09.26.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 01:40:52 -0700 (PDT)
Date: Sat, 26 Sep 2026 10:40:50 +0200
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
Message-ID: <areFEuHcyziU2xXx@Lord-Beerus.station>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <ef56f98137eb9d1e0af3aa1b801186d829dba521.1790344389.git.stefano.r@variscite.com>
 <araMJFirhP86Dcb6@SMW015318>
 <araZ8pJGmDVXMjvE@Lord-Beerus.station>
 <arakXE94ZONxduMU@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arakXE94ZONxduMU@SMW015318>

On Fri, Sep 25, 2026 at 11:42:04AM -0500, Frank Li wrote:
> On Fri, Sep 25, 2026 at 05:57:38PM +0200, Stefano Radaelli wrote:
> > On Fri, Sep 25, 2026 at 09:58:44AM -0500, Frank Li wrote:
> > > On Fri, Sep 25, 2026 at 04:02:21PM +0200, Stefano Radaelli wrote:
> > > > From: Stefano Radaelli <stefano.r@variscite.com>
> > > >
> > > > Add separate DTSI files for the WM8904 and WM8731 audio options on
> > > > VAR-SOM-6UL and DART-6UL modules.
> > > >
> > > > Put each codec node, the SAI2 setup and its pinctrl in the selected
> > > > audio DTSI. This makes the WM8904 option explicit instead of placing
> > > > it in the shared module base.
> > > >
> > > > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> > > > ---
> > > >  .../imx/imx6ul-imx6ull-var-dart-wm8731.dtsi   | 71 +++++++++++++++
> > > >  .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 88 +++++++++++++++++++
> > > >  .../imx/imx6ul-imx6ull-var-som-wm8731.dtsi    | 71 +++++++++++++++
> > > >  .../imx/imx6ul-imx6ull-var-som-wm8904.dtsi    | 85 ++++++++++++++++++
> > >
> > > what's difference between imx6ul-imx6ull-var-som-wm8904.dtsi and
> > > imx6ul-imx6ull-var-dart-wm8904.dtsi?
> > >
> > > Frank
> > >
> > Hi Frank!
> > Thank you for taking the time to review this huge patch.
> >
> > The difference is in simple-audio-card,routing:
> > on DART-6UL, the microphone jack is routed to IN2L, IN2R and MICBIAS;
> > those routes are absent on VAR-SOM-6UL.
> 
> Is possible to share most part?
> 
> Frank
> 

Absolutely! I'll do that in V2.
Thanks!

Best Regards,
Stefano
