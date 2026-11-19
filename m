Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080094;
	b=yLUYaT06Nrt2RCQnr5vVH/fKsQMqCetJZqqCXshDiFPYtIAFS/4hzXbbxas5KlPYo2lI
	 PPnyy1j5z4TjmpYQS9YehsgycppoaBI8MYvFHn/BD/PaSpjje0z5WuUUYDgEr33r1sZFa
	 vZ3b/smMc7xuBrfxSCSsqB1yoILBtstfluqCUcxwg8EyxgxsTsn3f99Ks8+8Ebed2Hl2a
	 NAPBkP6/uAWIGHxS2ZLIGfZYdrXF4/XPZQh1drAHYW87PhVd1GgGCc0PkvDXh0BVV/B91
	 RVE+06t6kQRo6YgbxsGTvOcE0tT64urqXUW47dgTn1+HUYz0IXmC1UzD2rE+c8jlz6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080094;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Rp08SuOkuQ1f4/dmg1gQu4E8SljgXBOdR8OULNciJpY=;
	b=XrtQWrSsBZvP6p8ISP7ZmJtnRW46yxM36AAHUVZrkbr2P07kzroRwJnJEPzR10MiQqt4
	 5Sz36gUOfuwTAsb6x5x/ndRxeTxNiEVqXahy8G5RsG+R0QIadZAsxcYIJ50/E7ILe/sTA
	 RTJST5NRE6hdcEvGDGGC4sqR44bKH5SCBQTVfBTk9QO4QavErmUDDgnfqtPcRMD1aJZSQ
	 ldb6SE7KNFcwdEf2lhnG9avi1yvOMkZOeA6cUH4pof17nrk50Dww4DBirMtjXe6cAB31e
	 E0dGj2qSW1Y0T18GfxopL38UpIj0k7kAjxf+oUifirLKV7V/2CzaYKUcXaWGkbgrbNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMd+2yca;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902B606A330;
	Thu, 19 Nov 2026 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMd+2yca
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37901F000C4;
	Thu, 19 Nov 2026 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080094;
	bh=Rp08SuOkuQ1f4/dmg1gQu4E8SljgXBOdR8OULNciJpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aMd+2ycasMW9pEuzx3GZEJqDXfI+UTV9Abbqj9F5FYxORFQYuZSWsp4JblvkISEiv
	 CreeTWmU43Pcq8fwP2t7kpuU/u/mKD3qUi8+JXOieBrI02c4gn+zXFBDT41EHowFi6
	 Id52KNRWZ9AeM/78Xcgz/ngR6nwiGHxcF/SYXDNXP16T8tKNIBaluDeU3BpfrkeT+K
	 xWjtb43BGpVR0e4ESaapwcnU/ruBeFxODauK9upNRboofKNtcdW5BgFnFA932QxAvm
	 1BFQeNcxk4c2kfF2xVqpbvvlloFAGvvzkVAzyp0pMgF9tpTSo7vHPTuJiLWQHdat9d
	 ZlTr+aQ3zq8mg==
Message-ID: <sashiko-outbox-222817@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 10/11] media: chips-media: wave6: Add Wave6 thermal
 cooling device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <d973e48036b43e9f1e5fc254153303a4c21deebb.1795075582.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <d973e48036b43e9f1e5fc254153303a4c21deebb.1795075582.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:21:33 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: chips-media: wave6: UAF of thermal.dev due to devm
  teardown order
--

commit 4476163b22eacaa7f1b0467ae8902df8f1de4240
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 thermal cooling device

This commit adds a thermal cooling device for the Wave6 VPU that adjusts
the "perf" power domain's performance state based on its OPP table.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drive=
rs/media/platform/chips-media/wave6/wave6-vpu.c
> index 54a6567bc64a5..3e8cd67e0d718 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
> @@ -613,6 +613,21 @@ static int wave6_vpu_attach_pm_domains(struct wave6_=
vpu_device *vpu)
>  	return 0;
>  }
> =20
> +static struct device *wave6_vpu_get_performance_dev(struct wave6_vpu_dev=
ice *vpu)
> +{
> +	int index;
> +
> +	if (!vpu->num_pm_domains)
> +		return vpu->dev;
> +
> +	index =3D of_property_match_string(vpu->dev->of_node,
> +					 "power-domain-names", "perf");
> +	if (index < 0 || index >=3D vpu->num_pm_domains)
> +		return NULL;
> +
> +	return vpu->pd_list->pd_devs[index];
> +}
> +
>  static int wave6_vpu_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np;
> @@ -696,6 +711,13 @@ static int wave6_vpu_probe(struct platform_device *p=
dev)
>  		}
>  	}
> =20
> +	vpu->thermal.dev =3D wave6_vpu_get_performance_dev(vpu);
> +	if (vpu->thermal.dev) {
> +		ret =3D wave6_vpu_cooling_init(vpu->dev, &vpu->thermal);
> +		if (ret)
> +			dev_err(&pdev->dev, "failed to initialize thermal cooling, %d\n", ret=
);
> +	}

[Severity: Medium]
Can registering the cooling device via devm on vpu->dev cause a
use-after-free of vpu->thermal.dev during driver teardown?

When multiple power domains are attached via dev_pm_domain_attach_list(),
vpu->thermal.dev points to the virtual domain device in
vpu->pd_list->pd_devs[index], while wave6_vpu_cooling_init() registers
vpu->thermal.cooling via devm_thermal_of_child_cooling_device_register()
on vpu->dev.  Because wave6_vpu_remove() (and the wave6_vpu_probe() error
path) calls wave6_vpu_detach_pm_domains() before devres cleans up
vpu->dev, the cooling device remains registered after the virtual domain
device is detached and freed:

CPU0                                  CPU1
wave6_vpu_remove()
  wave6_vpu_detach_pm_domains()
    dev_pm_domain_detach_list()
      /* unregisters and frees
         pd_devs[index] */
                                      __thermal_cdev_update()
                                        wave6_vpu_cooling_set_cur_state()
                                          wave6_vpu_thermal_cooling_update()
                                            dev_pm_genpd_set_performance_st=
ate(thermal->dev, ...)
                                              <-- use-after-free
devres_release_all()
  thermal_cooling_device_unregister()

Attaching the power domains with devm_pm_domain_attach_list() before
wave6_vpu_cooling_init(), or unregistering the cooling device explicitly
before wave6_vpu_detach_pm_domains(), would keep the teardown order
consistent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795075577.gi=
t.nas.chung@chipsnmedia.com?part=3D10
