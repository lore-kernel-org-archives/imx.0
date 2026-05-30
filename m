Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C6D2D7380
	for <imx@lists.linux.dev>; Sat, 30 May 2026 00:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102202; cv=none; b=d3zuOr47KYaa0GrkCE/gLmqfgBUMrWYNOliRClhvWDP12WjyOkK0tkjI9Rd1R3BTm+TGiyIsw0tJysQD3sFyYEz6QeKPAOb3rm4MoIwSgiTrGH+3GxlUL9CAsKQ3GuCPsxfCeL6XTaZfaID6xlB6qlznPhyLXGEryUvE8dP0sN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102202; c=relaxed/simple;
	bh=9TKSixJMy+mzvc6cac1YSiilUBDSj4lx2oRmAbFYKWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L4rLwOuTvVfqnh/9zmMgn7L6oAS52eeTsmgcaRH0DZ/FIhioWG2RvXcrIUURt85fMpSRKlSuoTkEODqfB7BTDRe31fvGA1vYo5gLzL1MnQmDM6kAESPAhTK3wlNrtJbJoSxCdWNF1AgaicmXtXsOotCroEekGUA4J0Ehy9vH9qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsiPkfqS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsiPkfqS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4321F00898;
	Sat, 30 May 2026 00:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102201;
	bh=DKFotevhK52hnpp79KhKSwk1ScW/hTU6QLKGi6B62YE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WsiPkfqScFvCI7mJJoTZtdaEK9VB4xRNQoM2hyVYlFHot4VbUOFcxw7sq6ALXwWMH
	 c3J9TCFQl0+0TUh/yduXqLPEM4lG2l/uvxRDsxpNoRxuthL4wY2/Z85proyqR7QRXQ
	 99q0zcapvepb1C0QyYvCTM/HJajGIF130TZbs8kTj4Fjd0foR6KDgfp3r0kztuJJvF
	 O9M5xWjdqHpj83hKU1KvsbENiPf8mbHfbxzJ/KVlgBuj+xuQ/DIbpf8aru4lizkwil
	 bmOxFUcXW1QFZ2JsGehYwl/T67h6LoWo1G+awzi6sSCB40LsVMXhLSSIABQU+Rs6xC
	 yQvkyBZSFQBsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 7/9] net: dsa: netc: add VLAN filter table and
 egress treatment management
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260527100217.794987-8-wei.fang@oss.nxp.com>
References: <20260527100217.794987-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:50:00 +0000
Message-Id: <20260530005000.BB4321F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Clearing the software shadow state (`untagged_port_bitmap`) when a=
 port is removed from a VLAN causes desynchronization with the hardware Egr=
ess Treatment Table (ETT), leading to incorrect frame tagging if the port i=
s subsequently re-added.
--

commit dda410d83f4ea2d60e53d4dd219537fabab568c5
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add VLAN filter table and egress treatment management

This commit implements the DSA port_vlan_add and port_vlan_del operations
to enable VLAN-aware bridge offloading on the NETC switch. It maintains
VLAN membership in a VLAN Filter Table and egress tagging rules in an
Egress Treatment Table.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index d4475ad7ed6c2..4db42c888470c 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -1025,6 +1054,369 @@ static void netc_switch_get_ip_revision(struct ne=
tc_switch *priv)
[ ... ]
> +static int netc_port_del_vlan_entry(struct netc_port *np, u16 vid)
> +{
> +	struct netc_switch *priv =3D np->switch_priv;
> +	struct netc_vlan_entry *entry;
> +	struct vft_cfge_data *cfge;
> +	int port =3D np->dp->index;
> +	u32 vlan_port_bitmap;
> +	int err =3D 0;
> +
> +	mutex_lock(&priv->vft_lock);
> +
> +	entry =3D netc_lookup_vlan_entry(priv, vid);
> +	if (!entry)
> +		goto unlock_vft;
> +
> +	cfge =3D &entry->cfge;
> +	vlan_port_bitmap =3D FIELD_GET(VFT_PORT_MEMBERSHIP,
> +				     le32_to_cpu(cfge->bitmap_stg));
> +	/* If the VLAN only belongs to the current port */
> +	if (vlan_port_bitmap =3D=3D BIT(port)) {
> +		err =3D ntmp_vft_delete_entry(&priv->ntmp, vid);
> +		if (err)
> +			goto unlock_vft;
> +
> +		netc_delete_vlan_egress_rule(priv, entry);
> +		netc_del_vlan_entry(entry);
> +
> +		goto unlock_vft;
> +	}
> +
> +	if (!(vlan_port_bitmap & BIT(port)))
> +		goto unlock_vft;
> +
> +	cfge->bitmap_stg &=3D cpu_to_le32(~BIT(port));
> +	err =3D ntmp_vft_update_entry(&priv->ntmp, vid, cfge);
> +	if (err) {
> +		cfge->bitmap_stg |=3D cpu_to_le32(BIT(port));
> +		goto unlock_vft;
> +	}
> +
> +	entry->untagged_port_bitmap &=3D ~BIT(port);

[Severity: High]
Could this lead to a desynchronization between the software shadow state
and the hardware Egress Treatment Table (ETT)?

When a port is removed from a VLAN with multiple members, the software
untagged bit is cleared here, but it looks like the hardware ETT entry
for this port is left unmodified.

If the port was previously configured as untagged, and is later re-added to
the same VLAN as a tagged port, netc_port_set_vlan_entry() uses
netc_port_vlan_egress_rule_changed() to check for changes:

static bool netc_port_vlan_egress_rule_changed(struct netc_vlan_entry *entr=
y,
                                               int port, bool untagged)
{
        bool old_untagged =3D !!(entry->untagged_port_bitmap & BIT(port));
        return old_untagged !=3D untagged;
}

Because the software state was cleared during removal, old_untagged evaluat=
es
to false. If the port is re-added as tagged (untagged is also false), the
function will return false and skip updating the ETT hardware.

Does this mean the ETT hardware remains in its stale untagged mode, which
would incorrectly strip VLAN tags from frames egressing this port?

> +
> +unlock_vft:
> +	mutex_unlock(&priv->vft_lock);
> +
> +	return err;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527100217.7949=
87-1-wei.fang@oss.nxp.com?part=3D7
