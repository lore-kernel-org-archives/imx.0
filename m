Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A2C3E5599;
	Wed, 24 Jun 2026 21:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335226; cv=none; b=unOhlxrqBNYaT2nBJUIAmO4/elADgpiBh6rRkZILogE0jx8Bo5Tc5+KjUH0vcTwIvLXLNv+sZOIVr79IXQrrf5TLeXvwApvqd/iVO/BvCqQviKOYUUFRtWa5pUJBvBD+R9KBMtB+WgAntNDohvlt6ntl0Y1Ab1TTd75JowAwS1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335226; c=relaxed/simple;
	bh=wLX0Qnz/2kv6rYdfPeLH4g6pL75eR414jLfj3ku3FRQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lQgF5jE/RdxPVUMmNwZv+ee2VJmyFJZTo6zmi4qcdskSJK0Kk0Aa/nY3RUhc+Ye209by7fc4JV0OeHUs8qi+ShWBL2PK60bdUv66DWJfP6UCpl+3TYOPdLNjzEi+VMlO5nZTdFs9eU+Ym8V7tdeFd9l9rKTCi0lzzMkJQ2EREmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFtXsDf6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFtXsDf6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6440F1F000E9;
	Wed, 24 Jun 2026 21:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782335223;
	bh=IFruGrADjEpACkLysI145JskxTSo7XMx9RG+dJJ95Ao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AFtXsDf6yBtI+CTr9FZu3twiFcIP57cttdMJtmHp5Yr6qLMEMIcJ7e8HwdQe/KZsB
	 6sdnL/9WQx5u0KLhOxXVz8WJa0D+l2YeHXIRw0ecEZ7LAZcA8J6nl+dzAl9yIMsWg4
	 vFoniRAUmGmC5de+8lrmEMfN7cAmMH4HbeWZAl59Rrw5a/Qol5QQbMNJz9l+pgt6FW
	 N78BAlfZYu/uz860B3ge7h3DI9R3WfZfu+vZWq5sIJCzzP6B+a3PgkvCLht0pucM9A
	 11yOqFOThZQuvGqmKprYKPnq4yLnYv7ZICaS2tTV6G6EOM0SRmgKW8beM0DJeuLdIc
	 V7IXv/m3hb29Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/9] media: synopsys: Use
 media_async_register_subdev() to simplify code
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260624-imx8qxp_pcam-v6-5-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
 <20260624-imx8qxp_pcam-v6-5-4b3f45920d2f@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 21:07:02 +0000
Message-Id: <20260624210703.6440F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [Critical] Critical out-of-bounds heap write in v4l2_async_nf_parse_fwnod=
e() due to mismatched endpoint counting.
- [High] Mixed goto-based error handling and __free() cleanup violates subs=
ystem rules and leaves a dangling pointer.
- [High] Hardcoded array indexing for pads mismatches the dynamic Device Tr=
ee enumeration order.
- [High] Heap out-of-bounds access and routing validation failure on single=
-endpoint Device Trees.
- [High] Memory leak of `sd->active_state` on subdev registration failure.
- [High] Unconditional memory leak of `sd->subdev_notifier` during driver r=
emoval.
- [High] Leaked async connections and fwnode references on error path.

Pre-existing issues:
- [High] Lockless traversal of the media entity links list causes a race co=
ndition.
--

commit 892732bd4672cbe12751cfc2979a3f508c5cde6d
Author: Frank Li <Frank.Li@nxp.com>
Subject: media: synopsys: Use media_async_register_subdev() to simplify code

Use the media_async_register_subdev() to simplify the driver.
Replace the local subdev registration and media pad setup code with
media_async_register_subdev(). Reduce boilerplate code and aligns the
driver with the common pattern used by simple subdevices that each media
pad has one endpoint in fwnode.

> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/m=
edia/platform/synopsys/dw-mipi-csi2rx.c
> index f51367409ff46..0fabc89a49b80 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
[ ... ]
> @@ -360,9 +350,10 @@ dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_dev=
ice *csi2, u32 mbus_code)
> =20
>  static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
>  {
> +	struct media_pad *sink_pad =3D &csi2->sd.entity.pads[V4L2_SUBDEV_1TO1_P=
ADS_SINK];

[Severity: High]
Does this hardcoded index match the dynamic pad allocation from the Device
Tree?

Because v4l2_async_nf_parse_fwnode() populates the pads array strictly in t=
he
order endpoints appear in the Device Tree, accessing index
V4L2_SUBDEV_1TO1_PADS_SINK unconditionally here assumes the sink pad is alw=
ays
at index 0.

If a platform's Device Tree lists the source endpoint before the sink
endpoint, will the driver access the wrong pad and potentially read incorre=
ct
hardware parameters (like lane counts)?

> +	u32 lanes =3D sink_pad->vep.bus.mipi_csi2.num_data_lanes;
>  	struct media_pad *source_pad;
[ ... ]
> @@ -549,12 +539,12 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l=
2_subdev *sd,
>  	u64 mask;
>  	int ret;
> =20
> -	sink_pad =3D &sd->entity.pads[DW_MIPI_CSI2RX_PAD_SINK];
> +	sink_pad =3D &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
>  	remote_pad =3D media_pad_remote_pad_first(sink_pad);

[Severity: High]
This isn't a bug introduced by this patch, but does this lockless list
traversal race with userspace ioctls?

Calling media_pad_remote_pad_first() iterates the media entity links list:

drivers/media/mc/mc-entity.c:media_pad_remote_pad_first() {
    ...
    for_each_media_entity_data_link(pad->entity, link) {
    ...
}

Since v4l2_subdev_enable_streams() does not acquire the global
mdev->graph_mutex, could this traversal race with userspace ioctls like
MEDIA_IOC_SETUP_LINK that mutate the graph structure, leading to linked list
corruption or a use-after-free?

>  	remote_sd =3D media_entity_to_v4l2_subdev(remote_pad->entity);
[ ... ]
> @@ -649,9 +639,9 @@ static int dw_mipi_csi2rx_init_state(struct v4l2_subd=
ev *sd,
>  {
>  	struct v4l2_subdev_route routes[] =3D {
>  		{
> -			.sink_pad =3D DW_MIPI_CSI2RX_PAD_SINK,
> +			.sink_pad =3D V4L2_SUBDEV_1TO1_PADS_SINK,
>  			.sink_stream =3D 0,
> -			.source_pad =3D DW_MIPI_CSI2RX_PAD_SRC,
> +			.source_pad =3D V4L2_SUBDEV_1TO1_PADS_SOURCE,

[Severity: High]
Could this cause an out-of-bounds heap access if the Device Tree only defin=
es
a single endpoint?

When __media_async_register_subdev() dynamically sizes the pads array based
on ep_count, a Device Tree with only a sink endpoint will result in an array
of size 1.

Since the driver unconditionally sets up active routes referring to
V4L2_SUBDEV_1TO1_PADS_SOURCE (index 1), won't this attempt to access pads[1]
on a size-1 array?

>  			.source_stream =3D 0,
>  			.flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>  		},
[ ... ]
> @@ -764,45 +697,12 @@ static int dw_mipi_csi2rx_register(struct dw_mipi_c=
si2rx_device *csi2)
>  	snprintf(sd->name, sizeof(sd->name), "dw-mipi-csi2rx %s",
>  		 dev_name(csi2->dev));
> =20
> -	pads[DW_MIPI_CSI2RX_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK |
> -					      MEDIA_PAD_FL_MUST_CONNECT;
> -	pads[DW_MIPI_CSI2RX_PAD_SRC].flags =3D MEDIA_PAD_FL_SOURCE;
> -	ret =3D media_entity_pads_init(&sd->entity, DW_MIPI_CSI2RX_PAD_MAX, pad=
s);
> +	ret =3D media_async_register_subdev(&csi2->sd);

[Severity: High]
Does calling media_async_register_subdev() here expose a dangling pointer d=
ue
to mixed goto and __free() usage in __media_async_register_subdev()?

In drivers/media/v4l2-core/v4l2-fwnode.c:__media_async_register_subdev(), t=
he
pads array is bound to scope-based cleanup and assigned to sd->entity.pads:

    struct media_pad *pads __free(kfree) =3D kzalloc_objs(struct media_pad,
                                                        ep_count);
    ...
    sd->entity.pads =3D pads;

If __v4l2_async_register_subdev() fails, the code jumps to out_unregister:

    out_unregister:
        v4l2_async_nf_unregister(notifier);

Because the function returns, pads is automatically freed, but sd->entity.p=
ads
is not set to NULL. Does this leave a dangling pointer in the subdevice?

[Severity: High]
Could media_async_register_subdev() leak the active state if registration
fails?

In __media_async_register_subdev(), v4l2_subdev_init_finalize() dynamically
allocates sd->active_state. If the subsequent call to
__v4l2_async_register_subdev() fails:

    ret =3D v4l2_subdev_init_finalize(sd);
    if (ret)
        goto out_unregister;

    ret =3D __v4l2_async_register_subdev(sd, module);
    if (ret < 0)
        goto out_unregister;

The error path jumps to out_unregister and returns without calling
v4l2_subdev_cleanup(). Does this bypass freeing the active state?

[Severity: Critical]
Can this call trigger a heap out-of-bounds write if the Device Tree contains
disabled or disconnected endpoints?

In __media_async_register_subdev(), the pads array is allocated based on
ep_count, which only counts available connected endpoints (flags=3D0):

    struct media_pad *pads __free(kfree) =3D kzalloc_objs(struct media_pad,
                                                        ep_count);

However, v4l2_async_nf_parse_fwnode() iterates over all endpoints without
filtering:

    fwnode_graph_for_each_endpoint_scoped(dev_fwnode(dev), ep) {
        ...
        ret =3D v4l2_fwnode_endpoint_parse(ep, &pad->vep);

If there are disconnected endpoints in the Device Tree, the loop will itera=
te
more times than ep_count. Will this increment the pad pointer beyond the
allocated array and overwrite adjacent memory?

[Severity: High]
Does media_async_register_subdev() leak async connections and fwnode
references if an error occurs during endpoint parsing?

In v4l2_async_nf_parse_fwnode(), newly allocated async connections are added
to the notifier. If an error occurs in a subsequent loop iteration:

    if (IS_ERR(asd))
        return dev_err_probe(dev, PTR_ERR(asd), "failed to add notifier\n");

The function returns directly. Then in __media_async_register_subdev():

    ret =3D v4l2_async_nf_parse_fwnode(dev, pads, notifier);
    if (ret < 0)
        return ret;

This bypasses the out_cleanup label and fails to call v4l2_async_nf_cleanup=
(),
which seems to leak everything added to the notifier so far.

>  	if (ret)
> -		goto err_notifier_unregister;
[ ... ]
> @@ -993,7 +895,7 @@ static void dw_mipi_csi2rx_remove(struct platform_dev=
ice *pdev)
>  {
>  	struct dw_mipi_csi2rx_device *csi2 =3D platform_get_drvdata(pdev);
> =20
> -	dw_mipi_csi2rx_unregister(csi2);
> +	media_async_subdev_cleanup(&csi2->sd);

[Severity: High]
Does media_async_subdev_cleanup() unconditionally leak the subdevice notifi=
er?

The function __media_async_register_subdev() dynamically allocates the
notifier and assigns it to sd->subdev_notifier. During teardown here,
media_async_subdev_cleanup() calls v4l2_async_nf_cleanup() to clean the lis=
ts:

drivers/media/v4l2-core/v4l2-fwnode.c:media_async_subdev_cleanup() {
    ...
    v4l2_async_nf_cleanup(sd->subdev_notifier);
    ...
}

However, it does not appear to call kfree(sd->subdev_notifier). Will this
leak the notifier structure every time the module is unbound or removed?

>  	phy_exit(csi2->phy);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-imx8qxp_pc=
am-v6-0-4b3f45920d2f@nxp.com?part=3D5
