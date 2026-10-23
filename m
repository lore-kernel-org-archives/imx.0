Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764318;
	b=BGNR6HwE3t/Fln4UhmzRMEvICoTlIBg+Updg7UU5SJl/C5yFPaS1rxL18PppYFPPR+I7
	 RM9P6Oyt/s9GDIey/K3ephaXfSw7N3w44xxIoThZO7HX8GbaDtPrK5SroZ6rG8RLaR9IS
	 TGpkGkAXamIy9e0VNACDAIXsrZhnY23x/mB2UqBMhdbNxSjQOvKV+Kj+AOLrdlQa7Ej6P
	 op3UU3aWzgQy8528/Syh9+gkCqTX0B39+7oKm/L3MkzhuWJNYIMXSPMNVZCZzczRk3zsS
	 QPS9k5xs8rH9p1EqCuGQWuqGv1h8FSIBaVkGG02rQjCjQUGosdTh0hGmRUuXFe++rvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=;
	b=ggg2q6VHfqghbADdwVd/hSGrST8QrA/HOqYrNZgCZcI5zCPn58Fspfa85LLZYPjbWWB5
	 gW00Q572LU1bYxZBnaf9ExADsGyrov4pc30IcJ8uJCC7sqW7E3DCIqdZkROtkWSCH+08y
	 lkrby6VsvgwG01WfbKJzQDm+xVwAeQfA/YTvkDPD0aLpSpWv65gTmZTayisKoyyooZ6I2
	 jJbOaCYYyw7u8YTsTxWySrd9NpD9H+1FzAZJJtCRJjr3l8hSRWYnJLE6wYcbiONe5TTvi
	 siSWuEKXcCW4DXDKqcEe46R5rEQ9RtuuOzMa8sRK8MSGxoPlQhL8Zj5/mGlmtt2QUnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BldhecTS;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66DB606A31A
	for <imx@lists.linux.dev>; Fri, 23 Oct 2026 14:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BldhecTS
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8912005e9.3
        for <imx@lists.linux.dev>; Fri, 23 Oct 2026 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764316; x=1793369116; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=;
        b=BldhecTSKAup86UCV4X/HO2YxCQJz7xuILNlxJt9Bi9Lc4i/p+Ok3zVyY4L8QLN9Og
         Dp24oCo386S0moobIoC3UtqhKaNMJdzc8PvaHArVJbKGMV6VE99vlONrpfweei3I3Vqa
         yCRNM8kH8N6Btt9H+0Suzs5r4z69d0OIoUc+8I2UdNl8cmvOiSHCUKCxpcp2pUWwi3te
         D3E/Y0THK8bT6I2Oni9Segd8vjk7pkk3VSsHpuw1hu7pUG6J6ZIg98465FT5BMkDtYkE
         CDGmWtAwiYOhv+/yfpd1oKC5QncoLaztlS6SgeA00ccY47ZSnuxxg/faLFqEibU1a25p
         fnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764316; x=1793369116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=;
        b=sC1M1YMtR4ATTo86Sv5+9VXQpyhCFeNfuX8zCo04e6GTmkEaTHXAWlmbAsRTiPhzls
         bts7ROJMzwtdc7YiBDmVQpENJduxqx/sxaXI7iH/+8hv+LBugQZh7xgU2XJq9kKasuJt
         ntNsfuD5HrJBdO+4ZZ4rlIkEuOeuwIwvdUR+k6XmP0vuQVrc1cUntTLtPy3YgKGtgmhE
         Cbob3L+ms+OinGE6wqxOgBnypX2O8RDRH1xsoP24SYmeb8U+Own5nSl2cpTfK+MabY9b
         yvz4BpLKgqAReE2rdNvV07vT6BLsY1nLK0HJkSPZaXOHCYOGoiJmUj/vCAupLPKDNvzS
         /kyQ==
X-Forwarded-Encrypted: i=1; AKwUvByX792u5QfJTmYT3rt0ZLspxUminEXZmqPHagBQkNNWJX6MrMcyrwS6g8RLXcnE6tk5Z6E=@lists.linux.dev
X-Gm-Message-State: AFq9FYLCFpO8Hhn8xZSkN/HswQs94RTJzgrQ19zw8QbTRZBzc6qPJ+Bt
	y+kbT5okfpshRqnRx58nZt378JAqhcDbq8ufPmyJ47hRI3SxFdwssFzv
X-Gm-Gg: AYBFou2uQA8aBYvI6AdmtJO9u/UhAILNN5rR59yPdehw4a2DoAW5KKxKcHhH34nXwER
	P0WQ5wY9WU+NL3WQmWjixzAAud8A0ZEr7Z0BWz4twZNgQs5ynCmPbgslPmJwo9uEGXa/ES844WD
	xOLxICANDb0TV4k5ufnY/mKixI/UX63TjxiUFKXZn+qhXhNZgzsSIC/+Nod2INdfI4y5lhumvqa
	Y9j6u0VRPbjKGAFr4nvKedqiOaCok9srzMP0HhNvk9sFuA6AbikZ/zxjC1UgHqtq60ItuNuRc7z
	K1ovh3GnkKr6Qtassi05rj2K292If1dnkkogQPeOOwwZnxjuPZJfxtj9kyO1uFFUjIjrEqb6Ets
	bNExGdAEcaSm6MSHKxjK9Jr7uv+cFvusfwBuNASxDN3fpkYw2GMcZd7HPWmHKWXAmjnh+0bmcTy
	STYinRdT6jYaO8UXdIh+j2NoSlKO9A+7804EdTslCu8JC86RCpCuPyBKqiAdmS4vBiMurv0qtZl
	96um+zzVaqgO43yAwc48b2WaVM1pNznaJOUdsM4CScZSmAQSI/rEPbO3yIeQ8ETC5V3TBqj4rR0
	+u00THO06MuKLzT4/NzwQ1G6kC63HzTcCPa2kgve5HU3ZoHTSWAJah9Q
X-Received: by 2002:a05:600c:34c7:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4a211c9de3bmr42927825e9.6.1792764315768;
        Fri, 23 Oct 2026 07:05:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21545973csm31765235e9.4.2026.10.23.07.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:05:14 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:05:13 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: freescale: imx8m{m,p}-verdin: Add
 camera connector nexus
Message-ID: <stl2ybj3psmedmjdjbvzj6sstzte6dqwxywa5eph634qcyuydf@6byf4ay5vqau>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-2-90a30b0b0d55@toradex.com>
 <atp7I9fBUXhK7b4F@lizhi-Precision-Tower-5810>
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
In-Reply-To: <atp7I9fBUXhK7b4F@lizhi-Precision-Tower-5810>

On Thu, Oct 22, 2026 at 05:07:47PM -0400, Frank Li wrote:
> On Thu, Oct 22, 2026 at 04:31:26PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > The Verdin Development Board, Dahlia and Mallow expose the same 24-pin CSI
> > camera connector, while Verdin iMX8M Mini and Verdin iMX8M Plus route its
> > sideband signals and media pipeline through different SoC resources.
> >
> > Add a GPIO nexus to each carrier description and stable Verdin-level labels
> > for each module's CSI_1 I2C bus, receiver and capture engine. Keeping the
> > nexus in the carrier files avoids describing the physical connector on
> > carriers which do not provide it.
> >
> > This gives accessory overlays a stable connector and media interface
> > without embedding either module's wiring in the accessory description.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> ...
> Thank you for good progress.
> 
> >
> > +/* Verdin CSI_1 */
> > +verdin_csi_capture: &csi {};
> > +
> >  &ddrc {
> >  	operating-points-v2 = <&ddrc_opp_table>;
> >
> > @@ -596,7 +599,7 @@ &i2c2 {
> >  /* Verdin I2C_3_HDMI N/A */
> >
> >  /* Verdin I2C_4_CSI */
> > -&i2c3 {
> > +verdin_csi_i2c: &i2c3 {
> >  	clock-frequency = <400000>;
> >  	pinctrl-names = "default", "gpio";
> >  	pinctrl-0 = <&pinctrl_i2c3>;
> > @@ -695,6 +698,9 @@ eeprom_carrier_board: eeprom@57 {
> >  	};
> >  };
> >
> > +/* Verdin CSI_1 */
> > +verdin_csi_rx: &mipi_csi {};
> > +
> 
> Can you refer to port?
> 
> &mipi_csi {
> 	ports {
> 		verdin_csi_rx_port: port@0 {
> 		^^^^
> 		}
> 	}
> }
> 
> because difference mipi controller may use difference port index. If
> define point to port,
> 
> ov5460 can reuse if port@0 change to port@1.
> 
> Frank

Hi Frank,

Good point. In v4, I can refer to ports.

Ernest
