Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870844;
	b=0vnBsHjGmBhZsgOSmuGAsw/h+L00NWoNyI7fkzQ+2qxORGYZq0ikfeTGIsIO7sz1k6SH
	 4enWRbLNItKj5tdanlmuL0FscTjOotA00uJEQKD9qByfSMCvD5ROTivDdlH9Of8HV8081
	 9yAeD+r1nd9aiLolGIJCGqVmJ6xF90+apUiIBm5zw0bDOTpiCLQSLSjjV7NmkVTZ0MC3I
	 hHQjaxu9k7DdarG5BOGR+Vu7ipq99dtLwKuhM517vcGMErFKKpr4ZdaOeeNXUzNConWae
	 lnf0r9dDbX6eH/0RxBxMRCnrITv6EGB07E3YxM7jKcgqjQeAVr2RqY1yWeE08I/V78A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870844;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WDldH9PVvnKKP6hOrg0vTNPilRdAZqTeTP1gz1RnqDM=;
	b=XiDPsbx/64wTH0ObGWpnrn/CgN5GeQz3JERbyCwgWsi2DDbD6+2Qzo1RxQgz1ikd9ysG
	 FajsxUsHymWFEOPDspIbiOuMvP2TpmZ6s9XvY9U6THSg57RIAKQ7ME37P4P7Wy+4VUNse
	 5th/+VcBM1LzKbt2NMhAp6H8WcUMM4HjgraiEpNL1ZHoWD5/plw0jZHSk7odRKgNtssoo
	 7j4urX1PlpsvyaZ17C859Y2rmQ2rYdBrO56zutYiDi1fIQz9m2QvsMEJ5M7Rbquojhivb
	 2QCt9Uxvs5AKG0edvtYAhZpkVIz/eD2NQXeBshgQ9UJr8WT/p6A1owvlILiXRzUXblA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pc7dTmkW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8C606D80A;
	Thu,  5 Nov 2026 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pc7dTmkW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F051F00A27;
	Thu,  5 Nov 2026 09:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870843;
	bh=WDldH9PVvnKKP6hOrg0vTNPilRdAZqTeTP1gz1RnqDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pc7dTmkWOcxdj23zLwkiwCAKwatIlA7fJgAZw22xB70NRqWYav6tOnXUoGAaf6MqO
	 1/u/yepwL9Qhb8VbzljVFiiLI1yDY46veL3TSBKKlItRybE9nIdshiVwgx+6WMgorB
	 cEeFyGz4d+vdXcPHfbP818QzpmzmKvbZ333p2+HYvKHgGGqvdsCD8cVBrSJqkTJV34
	 yLJ1rkv85tGgHIzF40U/BdCRwXn8Kcd7Vnw5Bl2RZLQqJ/L7yWYQSjKl5GmSDxlOGx
	 nWACsJJXiQmrXXLt2GV12idf5EHi6IW7jk8iMoDZn2uC+VFf4uAmJkK5Skyd5GjiPc
	 Z5/wzFDhx2Vgg==
Message-ID: <sashiko-outbox-198763@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/4] net: enetc: add i.MX952 ENETC support
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaoning.wang@oss.nxp.com
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261104092217.1730351-4-xiaoning.wang@oss.nxp.com>
References: <20261104092217.1730351-1-xiaoning.wang@oss.nxp.com>
 <20261104092217.1730351-4-xiaoning.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 09:27:23 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: enetc: wrong PCI bus lookup in enetc_get_phc_index_by_pdev(=
) on i.MX952
--

commit 1b7e801c5a0f70e9aaf3045a92e91874399e99b2
Author: Clark Wang <xiaoning.wang@nxp.com>

net: enetc: add i.MX952 ENETC support

This commit adds i.MX952 (ENETC v4.6) PF and VF driver data with a 133MHz
NETC system clock to enetc_info, and updates enetc_get_phc_index_by_pdev()
to look up the PHC index for ENETC_REV_4_6.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drive=
rs/net/ethernet/freescale/enetc/enetc_ethtool.c
> index 7965dfd06f5f6..3c6c6fc0ab8cf 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> @@ -1149,6 +1149,7 @@ static int enetc_get_phc_index_by_pdev(struct enetc=
_si *si)
>  		devfn =3D PCI_DEVFN(24, 0);
>  		break;
>  	case ENETC_REV_4_3:
> +	case ENETC_REV_4_6:
>  		devfn =3D PCI_DEVFN(0, 1);
>  		break;

[Severity: Medium]
When enetc_get_ts_info() -> enetc_get_phc_index() falls back to
enetc_get_phc_index_by_pdev() (such as on an SR-IOV VF where
si->pdev->dev.of_node is NULL, or on a PF when the optional ptp-timer
phandle is omitted from the Device Tree), it looks up the timer device on
the caller's own PCI domain and bus (si->pdev->bus):

drivers/net/ethernet/freescale/enetc/enetc_ethtool.c:enetc_get_phc_index_by=
_pdev() {
	struct pci_bus *bus =3D si->pdev->bus;
	...
	timer_pdev =3D pci_get_domain_bus_and_slot(pci_domain_nr(bus),
						 bus->number, devfn);
	if (!timer_pdev)
		return -1;
}

On i.MX94 (ENETC_REV_4_3), ENETC 0/1/2 reside on PCIe bus 1 alongside
Timer 1 (0x101) and ENETC 3 resides on PCIe bus 0 alongside Timer 0 (0x1),
so every ENETC has a timer at PCI_DEVFN(0, 1) on its own si->pdev->bus.

On i.MX952 (ENETC_REV_4_6), however, ENETC 0 and ENETC 1 are on different
PCIe buses:

drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c:
	#define IMX952_ENETC0_BUS_DEVFN		0x0
	#define IMX952_ENETC1_BUS_DEVFN		0x100

Since the PTP timer on i.MX952 is at function 1 of device 0 on the PCIe bus
of ENETC 0 (bus 0), won't calling enetc_get_phc_index_by_pdev() for ENETC 1
or its VFs search for PCI_DEVFN(0, 1) on ENETC 1's bus (bus 1) instead of
bus 0 and fail to find timer_pdev, causing enetc_get_ts_info() to return -1
for phc_index and fall back to software timestamping?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104092217.1730=
351-1-xiaoning.wang@oss.nxp.com?part=3D3
