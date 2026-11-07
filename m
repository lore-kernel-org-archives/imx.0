Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794084625;
	b=jah4DUOJW2TGIuehaqP354ChQCaOFR9xRIVd6gTNRlIcrNpIpWgIB5FqsntIfo2Mk8Pr
	 QSvN9xrPGuIDkKpEv/8VYZiTiH95BrMy0yJZOXCkfidVW5eJ64hkcXUynQWQM42iCUvEW
	 g9GK+NwL6f5/yOuSCJaIIRobtE60MBI0NLd61DByAzwK+ewbG3OIX6j3UCTvuxTJngDTI
	 jmBsalgGCeYHQPlepXKfZ6GaDjMJdQIQn3+ab4kbgrJ66CnZVoa2wdgrM6PC3ojWW3fw+
	 c22aBg9CAHgSxH2LRMSi927q0SboeVTwQXn2Wanl/I6ytznIuyn825WDL7p02hREO/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794084625;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7UAUebb/g+Wp7CssiwXsKs5HhFn0ypoAy54XK/SwtQ8=;
	b=pDxUrVaUnhdGbXDChPzLrhryXVx66p7bcQUVtYlGMoc7DukZIDOuzrbmDDjt2skHPtHk
	 LWwJ3v7IfU0tbigfGWrKLnHbqo4/uB9HXfcBj/CKkqqwhU1a7kU4wBGj+CplwN4DVbaFF
	 alFvEh3dPKPuQjMXow+R8ZXlxtHty2pf423IfDOTT11bDUx6FXg+x/KgyBCJy/9hgYnQd
	 0HAQ3NssqC0HY5zDOhRTpjNC6iH9xIkjyFiDv3WCdWnfT/uUGiXyuc4N+GaCoiYmIXEIS
	 iI0zWFjI7Wn2WBLqwhrED5nuDZoA8YnnB8itrPTzC3m0GT0JEettSpAYOmktNkJtcsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ahtQaV/8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913B7606A32C;
	Sat,  7 Nov 2026 20:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahtQaV/8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358391F0089F;
	Sat,  7 Nov 2026 20:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084625;
	bh=7UAUebb/g+Wp7CssiwXsKs5HhFn0ypoAy54XK/SwtQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ahtQaV/8F25RB4hf2Wvh8+n+4Mpn26NDPP7tsdhsAvP6XKMPxdCqySPAav9T9CFSd
	 i/g8lGs5KFPN0qxPNst1OjFh1cCH3b04JTnUciBJlkf+W6pjonMQYSM2kkt/M4tluF
	 rTEONKyS+fKzpzc9k7xabzQETIkPpoVMXhjyL77zCVI7/IRifAHhVpXaL2aN1kQHAY
	 FoSs2cxlBq46ykefvIpaqO0+bPw+aSpln3BgaVcS0CXwty6NVegxRQSnNAWaEtRjut
	 Wqfcks4OPawm1R46+cFQy64n5OvZmc8BAXM6AU6Pc1jzvKrs0cgIsd2hIjTItdJBkq
	 Z5hOTZV5HSIEw==
Message-ID: <sashiko-outbox-203330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/58] mtd: add opt-in lifetime ownership for backing
 objects
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Brian
 Norris" <computersforpeace@gmail.com>, "Boris Brezillon" <bbrezillon@kernel.org>, "Arseniy
 Krasnov" <AVKrasnov@sberdevices.ru>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Vitaly Wool" <vitalywool@gmail.com>, "David
 Woodhouse" <dwmw2@infradead.org>, "Russell King" <rmk+kernel@arm.linux.org.uk>, "David
 Woodhouse" <David.Woodhouse@intel.com>, "Mike Rapoport" <rppt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Christophe
 Kerello" <christophe.kerello@st.com>, "Jason Roberts" <jason.e.roberts@intel.com>, "Michal
 Simek" <michal.simek@amd.com>, "Boris Brezillon" <boris.brezillon@collabora.com>, "Mason
 Yang" <masonccyang@mxic.com.tw>, "Ramuthevar Vadivel Murugan" <vadivel.muruganx.ramuthevar@linux.intel.com>, "Stefan
 Agner" <stefan@agner.ch>, "Lucas Stach" <dev@lynxeye.de>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Dmitry Osipenko" <digetx@gmail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Jorge
 Ramirez-Ortiz" <jorge.ramirez@oss.qualcomm.com>, "Heiko Stuebner" <heiko@sntech.de>, "Yifeng
 Zhao" <yifeng.zhao@rock-chips.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, "Keguang
 Zhang" <keguang.zhang@gmail.com>, "Jacky Huang" <ychuang3@nuvoton.com>, "Shan-Chun
 Hung" <schung@nuvoton.com>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Han
 Xu" <han.xu@nxp.com>, "Liang Yang" <liang.yang@amlogic.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Kamal Dasu" <kamal.dasu@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Vladimir
 Zapolskiy" <vz@mleia.com>, "Piotr Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Harvey Hunt" <harveyhuntnexus@gmail.com>, "Maxim
 Levitsky" <maximlevitsky@gmail.com>, "Michael Walle" <michael@walle.cc>, "Srinivas
 Kandagatla" <srini@kernel.org>
Cc: "Tze Yee Ng" <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-3-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-3-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:50:21 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] mtd: refcount imbalance in __put_mtd_device() when
  master->dev.type changes
- [Medium] mtd: mtd_add_partition() allows adding partitions to an
  unregistered master
- [Medium] mtd: add_mtd_device() leaves mtd->dev.type set when
  dev_set_name() fails
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] mtd: core: use-after-free in add_mtd_device() [1]
--

commit da12394511d438335fb25ce60156c3307163ed8f
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: add opt-in lifetime ownership for backing objects

This commit introduces opt-in reference-counted lifetime management for
master MTD backing objects via mtd_set_release() and mtd_put_master(),
retaining the master and partition hierarchy while MTD handles, device
nodes, or OTP NVMEM providers remain active.

> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 558a605ba7495..42c06a02cd99d 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
[ ... ]
> @@ -748,16 +840,28 @@ int add_mtd_device(struct mtd_info *mtd)
[ ... ]
>  	mtd->index =3D i;
>  	kref_init(&mtd->refcnt);
> +	if (master->master.release) {
> +		mtd_get_lifetime(master);
> +		mtd->ref_master =3D master;
> +		if (mtd->parent && mtd->parent !=3D master)
> +			get_device(&mtd->parent->dev);
> +	}

[Severity: Medium]
Can a partition still be added through mtd_add_partition() after the
parent or master has been unregistered?

If a process keeps an open file descriptor to /dev/mtd0 across driver
unbind (mtd_device_unregister() and mtd_put_master()) and issues
BLKPG_ADD_PARTITION, mtdchar_blkpg_ioctl() -> mtd_add_partition() calls
add_mtd_device(child) without checking whether parent->registered is still
true.  Because del_mtd_partitions() has already run, the new partition is
never cleaned up, leaking the partition, its MTD ID, THIS_MODULE, and
master.life_refcnt.  Furthermore, once the open handle on the managed
master is closed, mtd_device_release() leaves master->dev.type set, so
opening and closing the leaked child partition will do kref_get() on a
zero master->refcnt and call mtd_device_release() a second time.

> @@ -839,29 +946,38 @@ int add_mtd_device(struct mtd_info *mtd)
>  		}
>  	}
> =20
> -	/* We _know_ we aren't being removed, because
> -	   our caller is still holding us here. So none
> -	   of this try_ nonsense, and no bitching about it
> -	   either. :) */
> -	__module_get(THIS_MODULE);
>  	return 0;
> =20
>  fail_nvmem_add:
>  	device_del(&mtd->dev);
>  fail_added:
>  	/*
> -	 * Clear type and set nop release to prevent mtd_release() ->
> +	 * Clear type and override release to prevent mtd_release() ->
>  	 * release_mtd_partition() -> free_partition() from freeing mtd.
>  	 * The caller handles cleanup on failure.
>  	 */
>  	mtd->dev.type =3D NULL;
> -	mtd->dev.release =3D mtd_dev_release_nop;
> +	mtd->dev.release =3D mtd_dev_release_done;
> +	dev_set_drvdata(&mtd->dev, &released);
> +	wait_for_release =3D true;
>  	put_device(&mtd->dev);
>  	of_node_put(mtd_get_of_node(mtd));
>  fail_devname:
>  	idr_remove(&mtd_idr, i);
> +	ida_free(&mtd_ids, i);
> +	if (mtd->ref_master) {
> +		mtd->ref_master =3D NULL;
> +		if (mtd->parent && mtd->parent !=3D master)
> +			put_device(&mtd->parent->dev);
> +		mtd_put_lifetime(master);
> +	}

[Severity: Critical]
This problem wasn't introduced by this patch, but can add_mtd_device()
trigger a use-after-free on the device_node [1] when
mtd_check_of_node() matches a partition node?

drivers/mtd/mtdcore.c:mtd_check_of_node() {
    ...
		if (plen =3D=3D mtd_name_len &&
		    !strncmp(mtd->name, pname + offset, plen)) {
			mtd_set_of_node(mtd, mtd_dn);
			of_node_put(mtd_dn);
			break;
		}
    ...
}

mtd_check_of_node() stores mtd_dn in mtd and immediately drops its
reference via of_node_put(mtd_dn) before add_mtd_device() calls
of_node_get(mtd_get_of_node(mtd)).  In a dynamic DT environment, if the
node is removed in that window, of_node_put() frees mtd_dn and
of_node_get() dereferences freed memory.

[Severity: Medium]
Does jumping to fail_devname when dev_set_name() fails leave mtd->dev.type
set to &mtd_devtype?

mtd->dev.type is assigned right before dev_set_name(), and clearing it only
happens under fail_added.  Leaving mtd->dev.type non-NULL causes any retry
of add_mtd_device() to fail at WARN_ONCE(mtd->dev.type, ...), and causes
__put_mtd_device() on an open partition to call kref_put(&master->refcnt,
mtd_device_release) on a master whose struct device was never registered.

[ ... ]

> @@ -1348,13 +1484,14 @@ int __get_mtd_device(struct mtd_info *mtd)
>  		return -ENODEV;
>  	}
> =20
> +	mtd_get_lifetime(master);
>  	while (mtd) {
>  		if (mtd !=3D master)
>  			kref_get(&mtd->refcnt);
>  		mtd =3D mtd->parent;
>  	}
> =20
> -	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> +	if (master->dev.type)
>  		kref_get(&master->refcnt);
> =20
>  	return 0;
> @@ -1441,6 +1578,7 @@ void __put_mtd_device(struct mtd_info *mtd)
>  	struct mtd_info *master =3D mtd_get_master(mtd);
>  	/* master can be freed in _put_device */
>  	struct module *owner =3D master->owner;
> +	bool managed =3D master->master.release;
> =20
>  	while (mtd) {
>  		/* kref_put() can relese mtd, so keep a reference mtd->parent */
> @@ -1451,12 +1589,14 @@ void __put_mtd_device(struct mtd_info *mtd)
>  		mtd =3D parent;
>  	}
> =20
> -	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> +	if (master->dev.type)
>  		kref_put(&master->refcnt, mtd_device_release);

[Severity: Medium]
Can master->dev.type change from NULL to non-NULL between
__get_mtd_device() and __put_mtd_device(), causing an unmatched
kref_put(&master->refcnt, mtd_device_release)?

When CONFIG_MTD_PARTITIONED_MASTER=3Dn, master->dev.type is NULL while
mtd_device_parse_register() runs parse_mtd_partitions().  If a first
partition is registered and opened by a notifier or userspace (seeing
master->dev.type =3D=3D NULL in __get_mtd_device()), and a later partition
fails to register in add_mtd_partitions(), del_mtd_partitions() unregisters
the first partition while it remains open:

drivers/mtd/mtdcore.c:mtd_device_parse_register() {
    ...
	ret =3D parse_mtd_partitions(mtd, types, parser_data);
	if (ret =3D=3D -EPROBE_DEFER)
		goto out;

	if (ret > 0)
		ret =3D 0;
	else if (nr_parts)
		ret =3D add_mtd_partitions(mtd, parts, nr_parts);
	else if (!device_is_registered(&mtd->dev))
		ret =3D add_mtd_device(mtd);
    ...
}

When nr_parts =3D=3D 0 and parse_mtd_partitions() returns a non-defer error,
mtd_device_parse_register() falls back to add_mtd_device(mtd), which sets
master->dev.type =3D &mtd_devtype and initializes master->refcnt to 1.
Closing the open partition handle then sees master->dev.type !=3D NULL in
__put_mtd_device() and drops master->refcnt to 0 while the master is still
registered.

[1] https://sashiko.dev/#/bug/linux-11fdb383-132f-473b-9284-101b4753fcd6

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D3
