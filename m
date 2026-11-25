Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627508;
	b=NMkaJ6UDOyV3oQYuAUfiy9K7Jy2ErRYye7RbuWN6q0BeOExol0KfGY17XP82482Uoj35
	 AzNsztjh8Aqnk2MMjz36QhRZHbRvH9GOWH/HQbHkQN+AuGChdTmr0sGm7We+yG5gSPgIA
	 mumhJQ7szaVFAb2a5mCCR3p90+Qbfd23KhwK2PKpf0KWinLQ6fxjl7CJVD2/JV8QAoZjg
	 Z895onnNf2Zb7B/9a9GQg5c+bEgDB64NM+3z6B0i01xo6u4S07+cm1ue5T75JS+FNNrWZ
	 3hNNST05IbmA3Ft4wj5nAD78w+XUblj32mEZ2j8cJb0TCEuM6cWJ2KI0SgbS00HYBeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/2ZiDJ9tq36ZHWmXeHMEUP2iypybL2OmKVpnewLrfEs=;
	b=1d9lRG2z5tHd2lg5Mmlcm8zKV08RJQkyChxRqjluSDlxF27uApeMR6v3WdKs0AQ7UZHI
	 frOisssCnKM6vZuJGEiDSrIc11AbUviOrvFZDUv1aeV6zJMZYM5+lYLinr1MinF/Wgk9A
	 AiFVJxg46az4WpF2hu9rc2CbakvjMXxm0uXuAy1goGGEnk6rCa6JJNsPap/PrOCVDk+aM
	 7WPVp/RKyq5/q5mJJil8bnWEzq1SI3YdBIElw4tSWAz98FpbxYggx/JaYm4Vz1qcealti
	 eK6Romr6H7dPu7WBOOHWr6GUv9W/B38OSiGaJy90xFHVP78feTQv64lIlJgMsxDfpsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lq3TfLa8;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6D6606A31E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E6D6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lq3TfLa8
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5339105f8f.2
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 09:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795627506; x=1796232306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/2ZiDJ9tq36ZHWmXeHMEUP2iypybL2OmKVpnewLrfEs=;
        b=lq3TfLa8ky6RX5EeePhz423I5+7tjvETz+5biZyPInH05EXol6accGXunAR9LlTbhi
         xdoX+34dUnYSiAyK2hDHFh3bzP4hUP2sz15dVF/vPmLYK/bQXTLl03e763LtgxyznsvT
         OigrzadkHrrQwM8my3dGpd2zUp8qBCJFo47A4lrK+FqbcANthSlHCUJSU1kf0iaM3F2O
         Ezlf1dpL2Tjdqdb+4qRznn3fsfz8R1Wt7FgORglpsJIEPtjcxUskN/bYaGKh81P5rBm9
         nwVWP7KGRPS92XmMDcZq6lccpuXNZnTIqfJ8yBPfGETlZWOeXTjfMRuOIZ+bcN/q3+6D
         RM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627506; x=1796232306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2ZiDJ9tq36ZHWmXeHMEUP2iypybL2OmKVpnewLrfEs=;
        b=y7Ok+aphk7xf1T2D1X4CUMUrgqvCovQvztw24+Pxeynjmlxb3foTtFZEXxLxHQ0PVT
         QTPAlH1PMbhFNFZp3QGGGS0abLcwZUUcRcugAbi4aftoulHl+ywOXGlXFC0B+PY2Q6xV
         MV3z/qZ7OzR+0YOH2Q1hE8vMfbpwTHJr+4yNHWPraFGc6ZwMcc3tLAksyKgwSDA/sv6d
         xpQc5gQASkwcxkO8c03jb/Z14fzvXttW8bdxTJpw6hs09uWdvLYNnG19vT4RNMZHS0+y
         pmpmfCAjXGp8oqz4TUbalR/tXLEgJKt9kH1q9cIXSDSWYaO+hHN3Ogxv12ECenuYVugm
         aa3g==
X-Forwarded-Encrypted: i=1; AL+hErELHHgTTpBGIQykbIQVNtVsLTVI+XbDtQMG0qw3X2/mDdgzWRkhBh5T+2TpBTQWpcd6tBk=@lists.linux.dev
X-Gm-Message-State: APuU4Z/FnrPzBTdIn4KWiFZKXuF1w+qitkFFb4JrHWMgs1VgKUOJV0i3
	ys5OGs7boKdC4sQhCkOCCB1C1XfiZBOhjayGOjo9zgu5WjEQlSFPOUKRcdtSvxs43fk=
X-Gm-Gg: AZFdTZfDOt7U+7Y+1mtM8avYHMIuch0iccXV71f5eUuK5w8zYf4YfDcMBSfnAmG7csd
	UbGiWIV4Qd5aHhvdoyujU8GlwsqIS19B2c4TRnQSwQpWex7khZ7UHWTj45k/G2/ohPmZ45xk184
	UZTvNCHfFRZ9yrUyZ8N/hHG53Chf0cDG4SsNeYFuxsIQ+zXpDmlh3Uu01kiSWqAk5M6j/A61qBv
	LBVlSLJOWeDCrd0P53v9fKH3dCw32rJHJBrYeGUlaS9czVrEpJ3Zvb+XzMPGtF0Oe9sLB8p6Qwl
	WWqe9Ld3eBLFTjbrHnQ59NCG8Q5NewcOrxKGQnI9wEtHriXWo2XoB7gEhUu9Esi6SYXTh8KnzO9
	NlFSthFMSdfVZRYsu6rSPpyCWcpTctp/Hc826Ky++oGvelJ4N4/9KCb4OQRaSz9mwybuewfi+Uw
	4ZEdP2/xh7NvFKkOY2hLM2HixeFT8FfijJns6TJuDgpQR8AwHfvrDXq/zN+6lKln9HwMw4L1RsE
	+JyBY+XMA5e0TziT+I3IU1w0ynkMMXrETiDqw168YZB4DdCiPcbt+Lw8TaQGSNEc8pZp9lnIB/z
	v56zYZhIWLRXN5BcGhKAW+FRLRS1ZL0dSkhWH7lEm7e6kG+IwMBmf2PI+YRyIhE6TQcCmjbwBpc
	wF7qqDLLLBnY62N01bQ==
X-Received: by 2002:a05:6000:178f:b0:4bb:c85e:d565 with SMTP id ffacd0b85a97d-4bbc86e17b5mr436127f8f.55.1795627506305;
        Wed, 25 Nov 2026 09:25:06 -0800 (PST)
Received: from localhost (p200300f65f19a904452474b9d670397a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4524:74b9:d670:397a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab658e2d1bsm37047838f8f.8.2026.11.25.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:25:05 -0800 (PST)
Date: Wed, 25 Nov 2026 18:25:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Joern Engel <joern@lazybastard.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Michal Simek <michal.simek@amd.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Brian Norris <computersforpeace@gmail.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
Message-ID: <awcZcuSbse5g3FWK@monoceros>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nbybrdipqtjlxyaa"
Content-Disposition: inline
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>


--nbybrdipqtjlxyaa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 04:28:26PM +0000, Pawel Zalewski wrote:
> This series is converting lists that contain the *_device_id structs,
> to make use of named initializers (which they do not use currently).
> This work is part of the on going effort in the kernel associated with
> device-ids [1]
>=20
> The plan is to convert *_device_id::driver_data to have an anonymous
> union, like it was introduced for PCI and I2C device ID tables.

Not sure I understand that. PCI and I2C wasn't converted yet. ieee1394
and zorro were.

> The goal is to increase type-safety (most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
>=20
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
>=20
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces for that field.
> This effort is split per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers
>   (which is this series)
> - actual implementations that make some of the modules use the new
>   driver_data_ptr member (which is not needed in the mtd subsystem)
>=20
> That way the task can be fragmented into manageable and independent chunks
> of work and makes this effort easier to review.
>=20
> Patches 1-3 implement the named initializer change.
> Patched 4-10 are just churn to unify the list termination and can be drop=
ped.
>=20
> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@bayl=
ibre.com
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

with or without addressing the nitpick I had for one of the patches.

Thanks for going through this
Uwe

--nbybrdipqtjlxyaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHGe4ACgkQj4D7WH0S
/k7Hxgf+JDQD3nuNyQeHxxoBDQbZLCdeqai2FGzqlA/wVP4ILYtl0Hj2B4Uvb51m
TWG5nlrssz3YpBalM5hoN7zT4/kYrvYV+kEZwlQ0rRaST1L1WSsaI+hIrd+sFqjI
E8CbBh9BDS8e2lqRUB02P2qNgrLW8OGoqjf65o8A416iktJ3LaEisuhLP8aVKb9O
G9s0nSWXydrbhPM3eKUGdumEvZViZRDTbdQOOZ3Ont4s0nic7RCuY5HxIJAv5u7h
n+QP/LXiSy/47VdwvRwqyJDfGxZnUzMHMxb0X6NQg1g1C/xCJFt3XHlD/eUHbI7K
axkOeY5ogCnXHhh12ds+XESv7iHqCw==
=xvDo
-----END PGP SIGNATURE-----

--nbybrdipqtjlxyaa--
