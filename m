Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC514483A6
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929934; cv=none; b=go67dbmcUzvMP+25Ldq7FZNG5lQwHMRJBYJBfTPNH4VPdTXUwe3rE9deV30o7TfcpduAeX+S8D0C1e5qwTdyloz1YcPGGEnxh7hiAPurK2OUv7nTW+9nnM1Q7h2RXhKS17Bi2uQPBe7G0GCUtHZmtN9HtDPkZ67jxpOj32ZVLNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929934; c=relaxed/simple;
	bh=BMOQwjuoegDgdBRrw6ftVN3h4UxWkKJmf0XXGY1DkVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKmf4fd25HQmBIEZczDO0z0UUVKpxDx4WrpjQevdiZU0Biu3Jpx+0EFZLS3GPT1kx8JclKK/yUCd4eJ/zrcaBm+uw990C4YwGREDrkHNrosqlyCyujW7IY/EMlRRSQ7rvIJSTuVuEKP7qHayKG+llmrnENUPkYDPurGBKMmK0EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWBnxygi; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWBnxygi"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso76057615e9.1
        for <imx@lists.linux.dev>; Fri, 02 Oct 2026 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929931; x=1791534731; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sNyEsDdUIjj9QdYmMndkCdcHkWuCIiwfefFpnISO5Vg=;
        b=rWBnxygifGO5e5l+GE/OoRUy10u5Cg2HVFXK5qj3JXGuKKUD9APLJ8/+8dMshUJmBC
         GFDs0du1Cr7uPLKIQW2OFCJKlUGdaMAra9GX+U04eH3GWMFP48ebjrnQQreFkdALgrE7
         /vW4mGbAJxEB9qnJOzrlVp3b2+OHRBHWkXJfOwHtk4aG/kBnzGwKi0g7hX8ugBh+fSAo
         30wZDc3bixj7/8zPDUp9d6lHIGNtym8tAidKUdOFSk9ed1+gI/pPbVB75odj91NTBoLi
         mTf3ni99BSI3DlpgjRrhsQ7qUYlijB1ZqrDnNSr0X0OocOM1CXsctV940SGKk0eiMrab
         JGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929931; x=1791534731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNyEsDdUIjj9QdYmMndkCdcHkWuCIiwfefFpnISO5Vg=;
        b=T+Nvx7tpxoMm7tZ7q5uWU+tXHjJH8xY2DzuYZw0fj1neuUWK6Fln38wfhu1cB3ZjnX
         xs9nvjCX0DbJxBbiX7fxgJjHtH+1q2w/iV14LK/XH/UgBVZ4/vShaNCS1+nbQ+G4t0fE
         85kWFENe05zTodSYIWqRaiG19UavzQpm6YDS52YVCKk9JNHfms4J2NTKSQX6dX0LXbru
         aUvlMmGTw8d4eAoHdt5xjGSmp938ki16PCRUsAbsm9hgtcvemWFcIqMmjdzwSNfLZ5bj
         7DZn/JqlI5Haw256W0o+5axHybxuEC6NmxRD/kaKfQV8Oi2b7Qj+P23Ei6EcWrzJjbrx
         6HzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOG+5lEfG+KX2wgB8GHSr/BgU4g+yvR+iV8JLR+uUaVZID1GfgZ5c23UFM4qXy4Wk30ZQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lvrFF8faBgGxuMtFUBKvm32DS/7fwS9jLOUhd53sB3i9VynPI0
	8fhqRPCte4cx0C4aE3aL0FgefqFhhN2yM5IAyPdV7ONyaeqpKwuclFOL
X-Gm-Gg: AYBFou0ObXEsIM2Z/TW1mge83F4nw0+TbqkoBiH3ovcYapn4+TpDDOuqxH4PEv7s8a/
	UGaLBia9i3HZDQv/w3tj4gCXw2Fe2DVekxCRtCx2D9j9a5Bd7Epc9x5fGca/iTfrt88VxHcy59m
	2lWJD2MHuDrcou2XygoyY9tgwQtVU5qOklx+dRgLobzN3HWXZ7gQj/1pEK08gW1OL55JmHvTnCt
	MfnRQmNnTfM+heKpC6/OlLYC+cXgrYfQ0q4epFPr7PUKiw4ifB3uTWm434JH812UvurtzWvzKw3
	IUaX3PtPnUfKCPcHd4O2q3GbIKwoqncWtSdbqvYLAYFgIu56ivl0Dsavgg0/7f+AyEiOH7zAes6
	LWmxyuZ1I6CC4sQPy1qkSEmsr8vQfKySBs9WwOy/6i77Dr8ksjvsQh9sPn40ue7Df7U2IjkFMF/
	cGB0y/uOkJm/TdiDgako8r6MGoXk3oRUguEC7RjuA2CIM7X6zkIpIqhr4gRQ5uyu2h7q/TwZ0Fo
	Ek//RbgN3jdGucNpseGKG3DvMZdwo/3lzpem7PbGvSERcv50uoTsLY6RBzrpZflaHg5K4dLqA==
X-Received: by 2002:a05:600c:2391:b0:4a0:21b9:a55c with SMTP id 5b1f17b1804b1-4a0276a0f7cmr24840835e9.29.1790929930373;
        Fri, 02 Oct 2026 01:32:10 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027da120bsm67567425e9.0.2026.10.02.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:32:09 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:32:08 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add
 Cortex-M7 remoteproc
Message-ID: <ew2g6ra2f7l35e56a3cslv53edmljlxm6d6rflakf2meftmjnz@ig6q45jlf6ms>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-1-7d1343ecd3ec@toradex.com>
 <ar5sBB5VvZPJVrmt@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar5sBB5VvZPJVrmt@SMW015318>

On Thu, Oct 01, 2026 at 09:19:48AM -0500, Frank Li wrote:
> On Thu, Oct 01, 2026 at 01:44:09PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > Describe the Cortex-M7 remote processor available on the Verdin iMX8M
> > Plus SoM.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> 
> This indepedent part. suggest send as sperated patch. This time, I can pick
> this one firstly.
> 
> Frank
> 

Hi Frank,

Okay, I will send a separate series for this part with the needed edits.

Ernest

