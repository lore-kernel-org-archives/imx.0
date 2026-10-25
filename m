Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792928605;
	b=JGH0iRMEAH27WrfinUpxj2KTqHivBVbo3V7xviqIdpnfPHVjUmJtvSb70bJGYlDENIdW
	 NTaXz7CUc5rn/9NaFyyaGpAGrdaZVHndZudhtHLnxdItKVQqRGiRaIFKJlSbvYOnBY0B0
	 uf5ccPQ72a6po0QiNBNLPEHk85ljySipQyfTZVLtswvBOqHcxRdp9sTg89FXIfOKHSbHE
	 SeCiQVt1MxSec/uziQk2mRfOqpzvl/Hu5uCQMSdCsEgIPOdhgwvicwXM8K5UQeF64KcdV
	 UB5758at7hPru4V9FCC5cmHahqNKQnuDNPB7K2OlZP3X7zDVFMEi+V3Un3V8HzShzog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792928605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=;
	b=KYI1KeJgw01eOyR/D88Pvkot+T1BjoBek3ZlTeyWmShUxXYaRMvV7jEFjFPG+T3KNCzO
	 DtgIlo/br0A4+/ARfrWDbb13Svd+Bru1xl2mEtYlYlFeFBIQ/JjtqnLLcqZsmXCfzRabZ
	 tl74pDHqrmu1LpL+wy3CN0oudaPt7vxnjaeOfDwH6QypZTJmPita+NQOXNMK3p6E43eq9
	 kEnKF8Xb1vaJImH8Nqroj/FS29bew+8rQZJQ6D7yPPcPLsi5whb6mpRVFbWNQ3TxI3KaS
	 gmMqqEhECgJZeBgVtwKLNoCY75f0Up+jJTr3ArkP5Pv4SOeh7W2YNfjmtWnDeOcu1Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XK12fOwk;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617D5606A329
	for <imx@lists.linux.dev>; Sun, 25 Oct 2026 11:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 617D5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XK12fOwk
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so4230255e9.2
        for <imx@lists.linux.dev>; Sun, 25 Oct 2026 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792928603; x=1793533403; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=;
        b=XK12fOwk33Q2J/S74u8lc4eHZwZ6VqxPe/ZAneaH09o5u1SlNNWIGYtCDlqzSdamaQ
         V40MLxGWbWlC+Qk19nJtwyvqH9+v+8616XL/vFaP+5ivFXBD7Zm5GUrkZ4tCcBE+Und9
         9OU0H26cjweJX0yA0kzYSRlZVzzYa4m+zmK3+VJ6z5XXeFVtwlw+45GXhPDABrOBy6S5
         clE++ct8rloiYYqqKuhsr72/6DoAyhCJ0L+FO5DmZnVJZYWY4ij12wv4fZdkCuupVcd5
         zg6zNxmZ/ImXBc1W87CpBf6jd1TrmhYG10j8ix/JyBio0hhDeD7WCyx7C+UUpJwR/HkF
         bx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928603; x=1793533403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNkrUZthoHTKm2i03POzDpLmDVfB4ha/LrHYDPEV1so=;
        b=1xYL/+ENKnj+qZdrV0XX7hAWlwS96OQ0DFBU3yREKtoJtwmrRjMihYHnNM+boCGg/k
         YhBUscktx3YtYGNS193hW8t9FG0TEFWKZkvTkQsksCauqqg9gplaIYjabkZZd4kuyghK
         DHegyiYsKFB65b9kNG4+ZiJe8X9/9J1W7ftmdviPx0ObP3TFtN9R+RcZv9r/yqXVXKR9
         7V48Okb6BEvU0ZDrlmPNEKvhXLzYKfApUJ1sfipASrL868X4SXeJcPmKb9tTn3hTgFGB
         IN0oUpZzm59wph0b6iiexA0WPjD2XCH7vGVgz539/5SxdMxOHE1xonBCRiNg1ENIy/dc
         W5Bw==
X-Forwarded-Encrypted: i=1; AKwUvBy5GXGeHgdmlRjJmxPgO+adBZAiXxIJgSnd9IgOaLSuYLg48EkgYOR9RieIGb4J+zmJ3mk=@lists.linux.dev
X-Gm-Message-State: AFq9FYImVNn4SwEk2+JsuHVIfW0C8D2kue0jxeMrLuUfgvwReNQtp+na
	UcuDz/XXPJ6Y0yOXxau5GriWPN7i1z18i6+FwDRRO4mIS6EX/9Ux34XI
X-Gm-Gg: AYBFou165LjuIhiNwP5hhu4DBSbPkLnuAshZvVcTApG0qLTA2Td4Tacf4HtCwd/Yarp
	DBcvR/rtYcTfwbUwcdNPYJnmtE4CWI7D94PxHHFuuLOnVEYfiDfhKAZ59vTeoDwKdfF0NC90DsJ
	lrVs6yb0lyuZMedQY3kIpMvUyiO4TGPRXcbCBiD45J3DpImu+1VVPoktbcBddtTebRXVYK6N/M8
	N3S5AMPihXzi87Du7GoNiV1vXBIQk8hf9e2VooHk+FRt9qpgO262m3zh7vaVrybx7aFF+KyZKXl
	4vKZRaEuDBhMVpSkb1jn2GP33smMrHk+kZjCXuW0RA8ExRJfiGnMSd8P1ClIiqX6MmA8992gXbO
	U8peh6C3xe6CcflITW03I+65jE/AfoUCRnnxZtg63sLZrgNoGZPuKkyG25JrbHuKpvn3Js/e+wf
	OJhF15G0g760zghbCSMpa1IIWcZ+lay1MAEojRZbRpO4elyD50lYbsqQRBJ0X04NiMIspweoXyw
	bbvV87xLayDlWKolitHQZ/FqJNUO5FuRJKeniM64vjNw9DH9A5MHssDImnB8ieJ8mJMCgoXlno+
	XzTqCUoCA2/Vsd/acWi30a1qLzp2XoPDmqZNU4D3MZ266Q6+qU0VCn+deFr4ZqBYV+U0wqnxy7i
	Zv3YPsw==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4a35aae5c48mr75332735e9.0.1792928602528;
        Sun, 25 Oct 2026 04:43:22 -0700 (PDT)
Received: from ernest.hoecke-nb (static-2a02-1368-6200-2fbc-a24b-7223-aeca-a4a6.cust.swissbackbone.net. [2a02:1368:6200:2fbc:a24b:7223:aeca:a4a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a4cb7bece3sm63901465e9.10.2026.10.25.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 04:43:21 -0700 (PDT)
Date: Sun, 25 Oct 2026 12:43:20 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: imx8mp-verdin: Add
 mezzanine OV5640 overlays
Message-ID: <ww6nhvo5agqub65eunynauzwkpi7lr2ntbnqhn7xm4nq4hirtf@yceeas6ulqy3>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
 <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
 <atvCMGUsLXImGhxZ@SMW015318>
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
In-Reply-To: <atvCMGUsLXImGhxZ@SMW015318>

Hi Frank,

On Fri, Oct 23, 2026 at 03:23:12PM -0500, Frank Li wrote:
> On Fri, Oct 23, 2026 at 03:51:17PM +0200, Ernest Van Hoecke wrote:
> > On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> > > On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > >
> > > > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > > > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > > > on this interface.
> > > >
> > > > The mezzanine can route the camera control signals through two jumper
> > > > configurations. Describe each configuration as a GPIO nexus mapping so the
> > > > camera description remains independent of the physical routing.
> > > >
> > > > The default positions share the native CSI_1 GPIOs and are intended for a
> > > > single camera. The alternate positions permit simultaneous native and
> > > > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> > > >
> > > > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > > > module uses 24 MHz, so provide variants for both.
> > > >
> > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> > > >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> > > >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> > > >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> > > >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> > > >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> > >
> > > why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > Both camera modules have their own oscillator, and the native and
> > Mezzanine connectors have their own supply, so each overlay describes its
> > own clock and regulator nodes. They also use a different I2C bus, CSI
> > receiver and connector. Both overlays are applied together for two
> > cameras (imx8mp-verdin-wifi-dev-dual-ov5640),
> 
> Okay, I see share one imx8m-verdin-ov5640.dtso
> 
> > so their node names and
> > labels must be unique, and a single .dtsi cannot be included twice.
> 
> mezzanine actually connect by another connectors ? so it need new one files
> because current nexus node's limitation.
>

Yes, the Mezzanine has its own camera connector, wired to the second
MIPI CSI-2 receiver of the i.MX8M Plus. Its GPIOs already go through a
connector nexus of their own, defined in the Mezzanine overlays.
 
> Can you make imx8mp-verdin-mezzanine-ov5640.dtsi also standardize, like
> use unified camera_i2c_2, camera_connector2, compre to imx8m-verdin-ov5640.dtso
>

This is possible, but the labels used by imx8m-verdin-ov5640.dtso exist
because that overlay is shared by Verdin iMX8M Mini and Verdin iMX8M Plus.
The Mezzanine is specific to the Verdin iMX8M Plus and connects to its
module-specific pins, which another module could wire differently. New
labels in the SoM dtsi would become ABI with these overlays as their only
user, so I would rather not add them. If a future Verdin module shares
this connector, I will add the labels then.
 
> And avoid dtso include dtso file.  Now perfer only include dtsi file.
> 
> Frank

Okay I will go back to only including dtsi in v4 of this series, and
also for the next SMARC series. Thanks.

Kind regards,
Ernest
