Received: from nx2.node01.servicehoster.ch (nx2.node01.servicehoster.ch [194.191.24.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15D6345731;
	Mon,  2 Mar 2026 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.191.24.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450460; cv=none; b=jtTj4hb+RzCWxAODa95/zpu91T0iqwLaNE5p2Yr8bzlhfAfrXoFXecl30Mwd2yC4ESYGPVOIsO4v9sGWQpiQuY+18nnZcPDtWRWIljJ/9DBrdUCYdfVljDu7oENXhrOc8Drm0czT4/od/KSt21Ot4kX2UrrNT1CLRey4eVhYE4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450460; c=relaxed/simple;
	bh=WwyEa8l3SslDBiWRd0d/NAedeeVlvkWMdSpEa79kRA8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nV/NhhSsusfawWlzMQLr3Uh8OETaitJlmfPSQxuGG5jXWLxU23EWBAB6+0AEMkqrLQQgFx75uhiPW2H/+PJHleS+f0f77JZiqUICgN+9pO8EGzw9WtDw4+pUNAFvU3siFsHyUrIkOZb2Lvkw61KMqoLSMMbBxFly/z9soePVd0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=active.ch; spf=pass smtp.mailfrom=active.ch; arc=none smtp.client-ip=194.191.24.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=active.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=active.ch
Received: from mailcluster2a.servicehoster.ch ([194.191.24.193])
	by node01.servicehoster.ch with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <max.krummenacher@active.ch>)
	id 1vx0y4-00HCLB-Ac; Mon, 02 Mar 2026 11:53:06 +0100
X-SecureMailgate-Identity: max.krummenacher@active.ch;mailcluster2a.servicehoster.ch
Received: from [192.168.0.7] (unknown [81.221.206.143])
	(Authenticated sender: max.krummenacher@active.ch)
	by mailcluster2a.servicehoster.ch (Postfix) with ESMTPSA id 37CF1280967;
	Mon,  2 Mar 2026 11:53:01 +0100 (CET)
Message-ID: <bd0bd330d140f9d9d222c72c3797f79d08fcae1d.camel@active.ch>
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
From: Max Krummenacher <max.krummenacher@active.ch>
Reply-To: max.krummenacher@gmx.de
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, Max Krummenacher	
 <max.krummenacher@toradex.com>, Conor Dooley <conor+dt@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peng Fan <peng.fan@nxp.com>,  Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer	
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 02 Mar 2026 11:53:00 +0100
In-Reply-To: <aaBi9lipWTG5l0hs@lizhi-Precision-Tower-5810>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
	 <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810> <aZdDF6BObEu_C4KJ@toolbox>
	 <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810> <aZ80BWH6DRu8_W_S@toolbox>
	 <aZ82pG3PO1HxD18B@lizhi-Precision-Tower-5810> <aaBA65_zLu8S6WMS@toolbox>
	 <aaBi9lipWTG5l0hs@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SpamExperts-Domain: mailcluster2.servicehoster.ch
X-SpamExperts-Username: 194.191.24.193
Authentication-Results: servicehoster.ch; auth=pass smtp.auth=194.191.24.193@mailcluster2.servicehoster.ch
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.50)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuV5syPzpWv16mXo6WqDDpKEChjzQ3JIZVFF
 8HV60IETFiu2SmbhJN1U9FKs8X3+Nt3nvpjOyc9og5eZ0P6yiBXRhyVb8cc2HlKMmMTxcNrgxVSV
 /ktnitLBGAv4kfhOkXHvrS0nTvrsqCjN96AbrFMr5g+sHZmT3CLVmxntdIVybYLDq53DrXiEtR/K
 7xKTyhGm4Zd53xWOh54QqC5fJ2uRaD8nBFjwI/3XjoYypgF0s1xh7hoyMoWHMkqYfQEaAmtp5ojp
 qLTLs12pdvNts5VayZresTl0x5kRSUnJUixAUf25Cgscc2Nqd9azmDa4ZbZ86axUW6RUEznBBnkD
 mNyHnBUeWIPsSyWMCkplUXGkvA5U9t4xcCUOm4tiv78RtCrG8nvBFH3d9xFD/N/gNzboggUuwlBN
 9wWn7gmrRLgzZEDeqo2sgKbYQHDPsju3XX1LReySiLvmUfzcNHKU7lNCIEeQBfykvHnvXxgGJEkG
 BR2LZ20By2bWko8AAad91XLZChvvX0vIR67mSHSiKNooyYSEKTGVzTecGj1gca7mZJUvkJc1KT8D
 OaInKwXx0sdHKvLDzn+sBlvbv5VnduIan0zA3kAAOS32dREOlczzOCzGkUqVpv9azOIDigV9X6zR
 b8FXBuaZAxFgz8C/ciuLvIw9+2G7xin9v7VjxrOBv1ul0mIkZu9pP/YHOu/q6CH0EBUIDJje1lf4
 Y2KgkQrdRk9Kt6RwZZwlIzglUynOpVim7PtCKE0UuzhfDdQqJPjcy1ACzQj09ZOWFSZbS0PbB7sF
 p5ENk8A98cjYSOmSKWDL5/jGPLKbxADaoEhvauFhvVoN90p0kEbROr7NTYMPt8C9mOBdONdnsxgs
 k1D2p7D8PtKaNmURoYs3Y26X9bG3wL2Y4F0412ezGCyTUPanhvVCLygj53ZMUVStQ2IfnP20/U4d
 GKTeVZMkNFeLHsbXs2KsRjKrCowEavDwQuKoD0aSx17uas8OR2tSsDFFvSf2lC8c/syIff2+5RQI
 v7cOuNFQ+5eGIII/qgXB3gv2NI/ukWuQBNrXV+EmIqM8SxKOhcObZXWnkEw+6F9CGyYXQ/Vn90EX
 +i1dl2AZIvCgKZ8UQ3LF/w9ss2zWq2pbnAAQwO9V60UHDWk60fHlT7AD0mcRXp3iH/O1nLlsNVT2
 jPnEEI9TCE3e2isf1z6t+ujB+7aPHHRK4noLauVdAM1enDazoJLxhFMa66bUfWX3SvEwTk7WvgFS
 pVoqK8ggB7nRSGa5Z4pklYLFEIKcZYHu+gDANlggXkXdyQvrQn/yW9glblkMLCwgVzjYKC0ryJs7
 wifKfcKIzGGwNqxHdU4s3QqMnembKNQOw4Ui2Q2UJjE2jY39B94Nt9PrRQmK1UwGfy6vxLe/c6M7
 OTy/A0MccBIk1Sag4dKiqCrF8eZZ9/XGyS4W3Zw9/CJcRlS6PLYYJZu5CaBzFuue81VsdkY0hEDA
 DcXMLV79lxGNlpsNeSv4soexJ46w662dei9d3zoSczYrJbv7cf/cwOMd8IpEzSZoyRPW59pg9u1i
 yfXBDWlFw9IjnUnVrU/pmYm3spyfhvHC7dbNGMalAgsekcqzWvuXoFa4yG1Ie1EE/ITIkBv0Y9OJ
 RItR1w18WQQlkdHbRWbjGEnqqThNSStYVa0=
X-Report-Abuse-To: spam@node01.servicehoster.ch
X-Complaints-To: abuse@node01.servicehoster.ch

Am Donnerstag, dem 26.02.2026 um 10:12 -0500 schrieb Frank Li:
> On Thu, Feb 26, 2026 at 01:47:39PM +0100, Max Krummenacher wrote:
> > On Wed, Feb 25, 2026 at 12:51:32PM -0500, Frank Li wrote:
> > > On Wed, Feb 25, 2026 at 06:40:21PM +0100, Max Krummenacher wrote:
> > > > On Thu, Feb 19, 2026 at 02:41:58PM -0500, Frank Li wrote:
> > > > > On Thu, Feb 19, 2026 at 06:06:31PM +0100, Max Krummenacher wrote:
> > > > > > Hi Frank
> > > > > >=20
> > > > > > On Thu, Feb 19, 2026 at 11:01:26AM -0500, Frank Li wrote:
> > > > > > > On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.co=
m wrote:
> > > > > > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > > > >=20
> > > > > > > > This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047=
b.
> > > > > > > >=20
> > > > > > > > The change introduced a regression: at least Colibri iMX6UL=
L and
> > > > > > > > Colibri iMX7 no longer boot with that commit applied, while=
 they boot
> > > > > > > > again after reverting it.
> > > > > > > >=20
> > > > > > > > Although this has only been verified on these two modules, =
the issue
> > > > > > > > is expected to affect all device trees using the gpmi-nand =
driver.
> > > > > > > >=20
> > > > > > > > [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> > > > > > > > [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> > > > > > > > [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> > > > > > > > [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> > > > > > > > [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> > > > > > > > [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> > > > > > > > [    0.899054] gpmi-nand 33002000.nand-controller: driver r=
egistered.
> > > > > > > > ...
> > > > > > > > [    0.960443] ubi0: default fastmap pool size: 200
> > > > > > > > [    0.960476] ubi0: default fastmap WL pool size: 100
> > > > > > > > [    0.960500] ubi0: attaching mtd4
> > > > > > > > [    1.636355] ubi0 error: scan_peb: bad image sequence num=
ber 1588722158 in PEB 4060, expected 1574791632
> > > > > > > > ...
> > > > > > > > [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to at=
tach mtd4, error -22
> > > > > > > > [    1.650029] UBI error: cannot attach mtd4
> > > > > > > > ...
> > > > > > > > [    1.670262] Kernel panic - not syncing: VFS: Unable to m=
ount root fs on unknown-block(0,253)
> > > > > > >=20
> > > > > > > Can you help found the real reason why not boot?
> > > > > > > nand@0 is preferred format for MTD raw nand.
> > > > > > >=20
> > > > > > > Frank
> > > > > >=20
> > > > > > I guess the root cause is that the driver for gpmi-nand predate=
s the
> > > > > > update of the binding rules which want the nand device describe=
d in
> > > > > > a child node 'nand@0' also for nand controllers which only can
> > > > > > control one nand chip.
> > > > > >=20
> > > > > > While it is possible to update the driver in the same patch set=
 as
> > > > > > changing the device tree to understand the new dtb rules, maybe=
 even
> > > > > > falling back to the old definitions this likely breaks other us=
ers,
> > > > > > most notable U-Boot.
> > > > >=20
> > > > > GPMI is widely used, include i.MX8 still use GPMI. Does below pat=
ch fix
> > > > > boot problem?
> > > >=20
> > > > My concern is that the new device tree (with the nand@0 subnode) is=
 not
> > > > yet understood by other consumers of the DT sources, e.g. U=E2=80=
=91Boot, older
> > > > Linux kernels (before the driver change), possibly barebox, and any
> > > > other consumer that relies on the kernel DT files.
> > >=20
> > > I understand, but we need move forward. we can keep both for transiti=
on.
> > >=20
> > > >=20
> > > > Updating only the Linux driver to support both the new and old bind=
ings
> > > > therefore solves only part of the problem. As long as these other
> > > > consumers do not understand both bindings as well, we cannot safely
> > > > update the shared DT sources. So I think the commit needs to be rev=
erted.
> > > >=20
> > > > In addition, the proposed fix in the driver is likely incomplete:
> > > > with the old binding there may be child nodes (i.e for partitions).
> > > > 'np =3D of_get_next_child(this->pdev->dev.of_node, NULL);' does the=
n find
> > > > a node whcih is not the node that actually describes the single NAN=
D
> > > > chip.
> > >=20
> > > I know it is incomplete, just want to check if it is the reason cause
> > > boot failure.
> > >=20
> > > >=20
> > > > An alternative approach could be to update the binding documentatio=
n
> > > > so that, specifically for the GPMI driver, the older binding is als=
o
> > > > considered valid.
> > >=20
> > > Not easy to do that, I try many method to update yaml file. common na=
nd
> > > flash detect node node "nand-controller".
> > >=20
> > > > Once the driver supports both the old and the new binding, the old
> > > > form could be marked as deprecated, but still allowed for compatibi=
lity.
> > > > This would avoid breaking existing consumers while giving us a path
> > > > to migrate DTs over time.
> > >=20
> > > Needn't revert all, just revert delete part, keep both to help migrat=
e.
> > >=20
> > > anyways, I need know if of_get_next_child(this->pdev->dev.of_node, NU=
LL);
> > > fix your problem.
> >=20
> > I tested the following on Colibri iMX7.
> >=20
> > kernel 7.0-rc1 and DTB are built from an untouched kernel at commit
> > 7dff99b35460 ("Remove WARN_ALL_UNSEEDED_RANDOM kernel config option").
> >=20
> > kernel 7.0-rc1 patched has the sources as above plus the changes you
> > propose to the gpmi-nand driver.
> >=20
> > DTB-reverted has the sources as above plus commit 8124b4a4a96b ("ARM:
> > dts: imx: move nand related property under nand@0") reverted.
> >=20
> >                               DTB        DTB-reverted
> >=20
> > kernel 7.0-rc1                fail       boots
> >=20
> > kernel 7.0-rc1 patched        boots      boots
>=20
> Thanks you for testing. I will work a formal patch for it. Can you help
> rework you patch, which keep both properties, just revert deleted part
> and keep everything nand@0, so it help transistion. you also start work
> uboot part.

We are happy to test any patch proposals on our hardware for U-Boot
and Linux, with and without the nand@0 subnode.

Please note that the current state as of Linux v7.0-rc2 is broken
for our NAND-based modules, and our CI no longer produces any useful
results as a consequence.

I strongly believe that, as an immediate first step, the commit
that moved the DT NAND chip configuration into its subnode should
be reverted.

Regards
Max

>=20
> I plan give additional 1 year to do transistion. This type layout actuall=
y
> exist for long time.
>=20
> Frank
>=20
> >=20
> > Regards
> > Max
> >=20
> > >=20
> > > Frank
> > > >=20
> > > > Regards,
> > > > Max
> > > >=20
> > > > >=20
> > > > > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers=
/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > index 51f595fbc834e..fb126a7c4a61e 100644
> > > > > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > @@ -2680,6 +2680,7 @@ static int gpmi_nand_init(struct gpmi_nand_=
data *this)
> > > > >  {
> > > > >         struct nand_chip *chip =3D &this->nand;
> > > > >         struct mtd_info  *mtd =3D nand_to_mtd(chip);
> > > > > +       struct device_node *np;
> > > > >         int ret;
> > > > >=20
> > > > >         /* init the MTD data structures */
> > > > > @@ -2688,7 +2689,10 @@ static int gpmi_nand_init(struct gpmi_nand=
_data *this)
> > > > >=20
> > > > >         /* init the nand_chip{}, we don't support a 16-bit NAND F=
lash bus. */
> > > > >         nand_set_controller_data(chip, this);
> > > > > -       nand_set_flash_node(chip, this->pdev->dev.of_node);
> > > > > +       np =3D of_get_next_child(this->pdev->dev.of_node, NULL);
> > > > > +       if (!np)
> > > > > +               np =3D this->pdev->dev.of_node;
> > > > > +       nand_set_flash_node(chip, np);
> > > > >         chip->legacy.block_markbad =3D gpmi_block_markbad;
> > > > >         chip->badblock_pattern  =3D &gpmi_bbt_descr;
> > > > >         chip->options           |=3D NAND_NO_SUBPAGE_WRITE;
> > > > >=20
> > > > > Frank
> > > > > >=20
> > > > > >=20
> > > > > > So I don't see a quick fix other than reverting and living with=
 the
> > > > > > dtb_check warning.
> > > > > >=20
> > > > > > Regards,
> > > > > > Max
> > > > > >=20
> > > > > > > >=20
> > > > > > > > Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related prop=
erty under nand@0")
> > > > > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.c=
om>
> > > > > > > >=20
> > > > > > > > ---
> > > > > > > >=20
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 =
+-----
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 =
+-----
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 =
+-----
> > > > > > > >  .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 =
+-----
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 =
+-----
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 =
+-----
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 =
+-----
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 =
+-----
> > > > > > > >  .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 =
+-----
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 =
+-----
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 =
++++--------
> > > > > > > >  .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 =
++++--------
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 =
+-----
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 =
+-----
> > > > > > > >  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 =
++------
> > > > > > > >  15 files changed, 22 insertions(+), 82 deletions(-)
> > > > > > > >=20
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dts=
i b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > index f452764fae00..547fb141ec0c 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > @@ -36,12 +36,8 @@ &clks {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	status =3D "okay";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &i2c3 {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b=
/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > index 58ecdb87c6d4..9975b6ee433d 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > @@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	status =3D "okay";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &i2c1 {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla0=
2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > index 6f3becd33a5b..aa9a442852f4 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > @@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	status =3D "okay";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &i2c1 {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phyco=
re-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > > index f2140dd8525f..85e278eb2016 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.=
dtsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.=
dtsi
> > > > > > > > @@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	status =3D "disabled";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &i2c3 {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dts=
i b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > index 131a3428ddb8..c93dbc595ef6 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > @@ -260,14 +260,10 @@ fixed-link {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	#address-cells =3D <1>;
> > > > > > > >  	#size-cells =3D <0>;
> > > > > > > >  	status =3D "okay";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &i2c3 {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/a=
rch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > index d29adfef5fdb..57297d6521cf 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > @@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	fsl,no-blockmark-swap;
> > > > > > > >  	status =3D "okay";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &i2c1 {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/ar=
ch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > index 40d530c1dc29..2a6bb5ff808a 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > @@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	status =3D "okay";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &i2c1 {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/=
arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > index 776f6f78ee46..e34c8cbe36ae 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > @@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	status =3D "disabled";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &i2c1 {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycor=
e-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > > index 27e4d2aec137..a3ea1b208462 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.d=
tsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.d=
tsi
> > > > > > > > @@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	status =3D "disabled";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &i2c1 {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/=
arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > index dc53f9286ffe..1992dfb53b45 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > @@ -296,13 +296,9 @@ &fec2 {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	fsl,no-blockmark-swap;
> > > > > > > >  	status =3D "okay";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &i2c2 {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi=
 b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > index eaed2cbf0c82..ec3c1e7301f4 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > @@ -160,15 +160,11 @@ &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > >  	fsl,use-minimum-ecc;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > +	nand-ecc-mode =3D "hw";
> > > > > > > > +	nand-ecc-strength =3D <8>;
> > > > > > > > +	nand-ecc-step-size =3D <512>;
> > > > > > > >  	status =3D "okay";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -		nand-ecc-mode =3D "hw";
> > > > > > > > -		nand-ecc-strength =3D <8>;
> > > > > > > > -		nand-ecc-step-size =3D <512>;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier boa=
rd) */
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-micr=
ogea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > > index 3dfd43b32055..43518bf07602 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dt=
si
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dt=
si
> > > > > > > > @@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-ecc-mode =3D "hw";
> > > > > > > > +	nand-ecc-strength =3D <0>;
> > > > > > > > +	nand-ecc-step-size =3D <0>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	status =3D "okay";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-ecc-mode =3D "hw";
> > > > > > > > -		nand-ecc-strength =3D <0>;
> > > > > > > > -		nand-ecc-step-size =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &iomuxc {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ul=
x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > index fc298f57bfff..83b9de17cee2 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > @@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	status =3D "disabled";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &uart1 {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.d=
ts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > index 8ec18eae98a4..2d9f495660c9 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > @@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
> > > > > > > >  &gpmi {
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	status =3D "okay";
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  &snvs_poweroff {
> > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/=
arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > index a41dc4edfc0d..8666dcd7fe97 100644
> > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > @@ -375,14 +375,10 @@ &gpio7 {
> > > > > > > >  /* NAND on such SKUs */
> > > > > > > >  &gpmi {
> > > > > > > >  	fsl,use-minimum-ecc;
> > > > > > > > +	nand-ecc-mode =3D "hw";
> > > > > > > > +	nand-on-flash-bbt;
> > > > > > > >  	pinctrl-names =3D "default";
> > > > > > > >  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > > > > > > > -
> > > > > > > > -	nand@0 {
> > > > > > > > -		reg =3D <0>;
> > > > > > > > -		nand-ecc-mode =3D "hw";
> > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > -	};
> > > > > > > >  };
> > > > > > > >=20
> > > > > > > >  /* On-module Power I2C */
> > > > > > > > --
> > > > > > > > 2.42.0
> > > > > > > >=20
