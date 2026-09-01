Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49FF381EAD
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250829; cv=none; b=JDRifVMYf8p5Dfd5XRci8cDAJZQLmEADiOv2gJSeRfC6/jaWS6dVHNza7z3iDt+cSmmM4Egjt8IYeBGj3GXfaOwPolcCQrM+41qOzMg2//zuzUAAmgWg+bE1m8uIY8Kl3csK0n5F8JE4Ody920WegWVNOhWMXEqWvpuQ99H+QBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250829; c=relaxed/simple;
	bh=Ic+CLdDGbifIlYmDOJGkFK7hDXi4CtqfPLaO6BU5F5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZDGdIA0KYT3vkrUfzKA4hdlJxQDyy5vbgYwXvFKpjGSFNSdy61V7VNdsS/tTn3mI6GDIhUjywa5BOoyy+IYl7wbNSuZZyz7xBbz0deMj1KozIjF5pm01y7H4C2znA8Ulqt0WikvibqEOtc7j7wcd0SZOi99vJIKUfC93pvpWSh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzAMK8x1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzAMK8x1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461281F00A3F;
	Tue,  1 Sep 2026 08:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250827;
	bh=YPvY5mQY4Zm0X/Cp19214IV09b0dFQf5gxsFF55Jnj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gzAMK8x1dfEvg2e0xje/wwvDPnoXtL5cO0twrXSQIXC57s+vt12FeaxuFhmqTKqbG
	 WwW6h0eU8gCywfRNjWQHWy1LSwMxd62Kur7OJNbORZfymgbPMqA1HSr2V3Jwgid1Hz
	 zOzQ/aPRFKG51pO1p90kNX2Gr4w4uA1cYtEoRfV3duycatv+mQKm8/ds3ju2bGXySB
	 aHAz8EYoO3BLWpH/6S9oM+XUb7rN9uA/g8fnL9tdkLL74pI8hVbbj80RKWRqz2K4/V
	 0wZfGV4BfU3RJ+a7nBQbMO/owqhbk/eHp4QodoTm6GhM6lv1H9xGZj1sfMD0fRhPgR
	 /DdnbMVKlAcDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 8/8] net: dsa: netc: add PTP one-step
 timestamping support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260831082335.1184605-9-wei.fang@oss.nxp.com>
References: <20260831082335.1184605-1-wei.fang@oss.nxp.com>
 <20260831082335.1184605-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 08:20:26 +0000
Message-Id: <20260901082027.461281F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver permanently pins its module in memory by unconditionall=
y acquiring a module reference during port initialization, completely break=
ing rmmod.
- [High] Calling `module_put(THIS_MODULE)` as the last step of an asynchron=
ous work item creates a race condition with module unloading, potentially l=
eading to a kernel panic.
- [High] Relying on the host's SKB destructor for switch MAC transmission c=
ompletion is unsafe and can lead to register corruption.
--

commit 4351c8721de223aecf2a4160d7f76a471ab63a0e
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: dsa: netc: add PTP one-step timestamping support

This patch adds one-step TX timestamping support for PTP Sync frames on the
NETC switch. It defers transmission to a process-context work item to safely
program the per-port PM_SINGLE_STEP register, ensuring only one frame is in
flight at a time.

diff --git a/drivers/net/dsa/netc/netc_ptp.c b/drivers/net/dsa/netc/netc_pt=
p.c
--- a/drivers/net/dsa/netc/netc_ptp.c
+++ b/drivers/net/dsa/netc/netc_ptp.c
[ ... ]
> +static void netc_onestep_destroy_work(struct work_struct *work)
> +{
> +	struct netc_onestep *onestep =3D container_of(work, struct netc_onestep,
> +						    destroy_work);
> +
> +	/* refcnt reaching zero does not by itself mean onestep->work has
> +	 * stopped: the last in-flight skb destructor calls schedule_work(&work)
> +	 * *before* the netc_onestep_put() that drops the final reference, so at
> +	 * the moment refcnt hits zero onestep->work may still be pending or
> +	 * running on another CPU. destroy_work and work are distinct work_stru=
cts
> +	 * and can run concurrently, so cancel_work_sync() is required to drain
> +	 * onestep->work before mutex_destroy()/kfree() below, otherwise a
> +	 * still-running work would touch freed memory. No new schedule_work(&w=
ork)
> +	 * can occur after this point because no references remain, so this
> +	 * cancel is final.
> +	 */
> +	cancel_work_sync(&onestep->work);
> +	netc_port_purge_onestep_queue(onestep, true);
> +	mutex_destroy(&onestep->work_lock);
> +	kfree(onestep);
> +	module_put(THIS_MODULE);
> +}

[Severity: High]
Can calling module_put(THIS_MODULE) at the end of an asynchronous work item
lead to a use-after-free panic?

If this drops the final module reference, a concurrent rmmod could proceed =
to
unload the module and free the module text memory. The worker thread, which
is still running and needs to return to the workqueue core, would then exec=
ute
unmapped memory.

[ ... ]
> +static void netc_onestep_skb_destructor(struct sk_buff *skb)
> +{
> +	struct netc_onestep *onestep =3D skb_shinfo(skb)->destructor_arg;
> +
> +	/* skb has been transmitted by hardware. Schedule work to send the next
> +	 * queued one-step Sync packet, then release this skb's reference on the
> +	 * context. If the port has already been torn down and this is the last
> +	 * reference, the context is freed via netc_onestep_release().
> +	 */
> +	schedule_work(&onestep->work);
> +	netc_onestep_put(onestep);
> +}

[Severity: High]
Is it safe to use the skb destructor as a proxy for the switch hardware's
transmission completion?

The skb destructor fires when the host NIC completes DMA to the switch, whi=
ch
happens before the switch MAC transmits the frame onto the wire. If the swi=
tch
egress queue is not empty, the first frame is still buffered inside the swi=
tch
when the destructor runs.

This would wake up the workqueue, which might then program the PM_SINGLE_ST=
EP
register for a second frame. By the time the first frame finally leaves the
switch MAC, it could use the wrong register values, potentially corrupting =
the
PTP timestamps or UDP checksums on the wire.

[ ... ]
> +static int netc_port_onestep_alloc(struct netc_port *np)
> +{
> +	struct netc_onestep *onestep;
> +	int err;
> +
> +	/* Hold a module reference until the last in-flight one-step Sync skb
> +	 * is freed by the conduit. Without this, the module could be unloaded
> +	 * before netc_onestep_skb_destructor() returns, causing a panic.
> +	 * Released in netc_onestep_destroy_work() after all cleanup is done.
> +	 */
> +	if (!try_module_get(THIS_MODULE)) {
> +		dev_err(np->switch_priv->dev,
> +			"Failed to get the driver module\n");
> +		return -ENODEV;
> +	}
> +

[Severity: High]
Does this permanently pin the module in memory?

Since this is called during port initialization, acquiring a module referen=
ce
here will make the reference count non-zero for the lifetime of the port. As
a result, the module can never be unloaded via rmmod, because rmmod requires
the module reference count to be zero before it will unbind the driver and
tear down the ports.

If the goal is only to prevent the module from unloading while packets are
in-flight, would it be better to acquire the reference dynamically when the
packet is queued, rather than globally at initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831082335.1184=
605-1-wei.fang@oss.nxp.com?part=3D8
