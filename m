Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E902D331205
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447922; cv=none; b=n69XcrMrlIQMTfpy1aHhkoFE6FHBgaadeIJEE+eOPLb0MUaCj0atBzYguDLApNirvDCVHTDsVLoB6JHwgnYRxvT2j+/isL73RTs08zwMlcDTm6e2i3u/dB1sD20unOU8HkWn2mWcUdXRzgODe5BrT0d0sp3URAkNOingYy0xyzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447922; c=relaxed/simple;
	bh=+dPP0pKLmuyRQWGO2igjZ68hfj2TtOyctwG0bH8SJm4=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:Cc:To; b=MkWDX5jmUn59BmShLppHjGeC8rq43ZdIj+tx0wIdZ10+777ETSmRbdCbTYH6hW+QY+8o8mJORFhhmQNrfuua/JI/NtkCGggNSjZlaqJqekXxp/a6YHCgkGmnLV5X/7CWXcwFDM+rYhiJZZMPsjH7u/iODFfj+sikEuYIuKCQ/DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qc2HBDsk; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qc2HBDsk"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-389e2950f54so3972831fa.0
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 02:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772447919; x=1773052719; darn=lists.linux.dev;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dPP0pKLmuyRQWGO2igjZ68hfj2TtOyctwG0bH8SJm4=;
        b=Qc2HBDskaYV20ojSG8w0KAXC2be6piHxVP3jOIaN8WyF5TE3RIApw8S754u4s4eA9h
         YCyXyzKozjLf9gGLCkrFAg9qIm21/XiwoaN+GuXT5IvRU9KxaVDCPF2Y0djGDDHBxpUT
         Wu+x7sPr84WRE14PCm53cL72PiFRkpidlWszGs6V/hkyquDbYThspwsfBXKpL2K7V25c
         X4w5Cc3hVscCf+wAHMdBEy8ysW3NSVdGfLt0Y7Ttz2ELKjf12F4xErHIxGwmdh5/2vuf
         AGepW8Zqcy5/JlbO4Hod28lp12Od90IpMxn3rbQQG3kO+ETCGVobj8snnCQObtK0EF2b
         1BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447919; x=1773052719;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dPP0pKLmuyRQWGO2igjZ68hfj2TtOyctwG0bH8SJm4=;
        b=ObMOtcnU21WlTJ+mdOQSodtje3ttqvjOaIgYLd2V8+TjNFTncMP/3AUvq/E0eOMh0C
         qAUxKsqhUbat9ZToiZWOx+Twoe/u9z4RVOttP+YwaNbjRY1KH+sbV/D4PVSBz4yJ2Jp5
         ZXpM13P5RT8hlz1XUZSfhtMuLleh+67v1FS5e1q9jrKEiOXW1eAmiv4zOyI1GeP7F/wP
         HWo0N/bOD+N2AdZX2YwetZnDM9r9V1P5vlfta12n8fiMNniR9j71Q9RA4+sC94ZsdN1d
         S34KQJu3jkhHFREZbWmKDw/GEKZTaAMqpHmtEnupnllTvYhqEBz4inJEvuD3reBWGQvL
         IhaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6ywUxyOD+bDL61kjORdYMg7wj5QyujMsG4tNdIbgIQHNL2cxOYXLmIDu3WK72+pN4XKs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxW1YliT27jv1phf1mPsuE4Y0ue3PNBw6g1CjmEl1dZzKWJBkW8
	Bxuu43PKwGeGCpZRNncGiFKoPIKl71dvoRDIpm7J7pPc0Vi/J6jdJrFL
X-Gm-Gg: ATEYQzwyjtCJffHbmVhbZHz3fDcALozKYH4cvf6h9HlL8lPbE7+cKJyXocErJFJ7RFc
	tWcK78RAAjsN8kMPNN8KJVlzV7Iadyw6W9IxcjOevLehVlxxhjeRe+vnUqnBLsNyB/hlRrg4/bC
	+FgGEdkgnV/R5BBAXy1UtNmShF7FQkG2ViLyrxbf2eWnSuraCF3FA9pEOzC2DlilzK0EsYYGv4K
	Y26cEPj1Mr52Qt8HbUS01bGv7GeRi9BaB/NsRqfM/ttu35iOximuU6OivvGPkb+s6fOCOJOIOiI
	TrdELb85Jv0jnFAsAC8SnOUUBxiPrvSgJ1wJ42kZhmJJQIdWnNarHfq77e8Ionc4DW8iX10SHOG
	ndPKklIKjHT9g1WJqMbe2NMrKoVrqEtxepcmhDBezecoYqyrhwz7uGZPiNaTeHx7JPO/KMPNZsk
	rwWjqEOaRMx1ifRZHEUhc3GkPDwds3IlPzAgzhqWbQVL3935sKu+j5wObdrSj3K1WgMASDvO+C7
	YdDATtyo5Wn
X-Received: by 2002:a2e:b018:0:b0:37f:d9ba:747 with SMTP id 38308e7fff4ca-389f1d73cecmr67253571fa.5.1772447918848;
        Mon, 02 Mar 2026 02:38:38 -0800 (PST)
Received: from smtpclient.apple (mobile-access-2e8433-189.dhcp.inet.fi. [46.132.51.189])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a116de019esm1424664e87.3.2026.03.02.02.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:38:38 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Kalle Niemi <kaleposti@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node through the adapter struct
Message-Id: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
Date: Mon, 2 Mar 2026 12:38:27 +0200
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Branden Scott <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,
 Matti Vaittinen <mazziesaccount@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: iPhone Mail (23D127)

=EF=BB=BFOn 3/2/26 10:55, Bartosz Golaszewski wrote:
> On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.com> w=
rote:
>> On 2/23/26 11:05, Bartosz Golaszewski wrote:
>>> In order to stop i2c bus drivers from dereferencing the struct device
>>> embedded in struct i2c_adapter, let's allow configuring the parent
>>> device and OF-node of the adapter directly through dedicated fields.
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
>>> ---
>> Hello,
>> Automated driver test system bisected this commit to be the first bad
>> commit, linux-next next-20260227 was tested. Failed tests include driver
>> tests for ROHM PMIC and accelerometers, which are connected to
>> BeagleBone Black.
>> The failed driver tests all fail to first i2cget and the tests stop
>> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file or
>> directory".
> Wolfram: well, now it would actually be useful to know which commit
> exactly is the culprit so maybe splitting the changes is not a bad
> idea after all.
> Kalle: which i2c bus driver fails here? Any errors in kernel log?
> Bart

Hello Bart,

i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel log. I=
 got two failures without the dmesg available (this is bugged test sequence,=
 and not a kernel crash), but those got the same stdout message "Could not o=
pen file ...." as all others.

-Kalle
