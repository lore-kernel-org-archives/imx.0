Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5843A48F83B
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 15:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003992; cv=none; b=PXylhYUU0Gi5K52E2Mrz1x0hsG5dodBSCMs4faRZT+M9pKZFkobAYzbfQtAL/pC7i+8kMwBqnXC97jLOFpStguOCFL7sTGNWBAw4GZ3JGYsMwqj5xTuIPH+qTD20Ir7yv4dJPGC/8fo6H/TGFnkLL5EotwFIlQD82TtMBBPUUpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003992; c=relaxed/simple;
	bh=T5uPgrfVPAdy5ijPsKrIrWo36pCK6jIM4tGNt0BFMlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHN6qbcsLEKdBlosQhMLIFr0+NR3tSIG70YeJBczTJmDJ1JkpSGCwaX2VyqjIUqJhyyH+pZsJy0dOlqaYSLVd6Zq8gmssGu/pqcabNso9tBHphy2PmA0LZcJsBtpIeVWwyctcU8yCI2Ps3ivoFVgprREftML+H7HJtDKzg2q6XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NuV22jhO; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NuV22jhO"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2485605f8f.0
        for <imx@lists.linux.dev>; Mon, 21 Sep 2026 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790003987; x=1790608787; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vV/yPDzhsjcBqB0No8n/B1gnDkpysOLtRQGRvwg7ZOw=;
        b=NuV22jhO+3qyESOoKtOYetnI4kcQxej+5y+VkxmlZc8nIarpRW/k/L7FjH1uF/utzu
         ufsasdPSZBBuVwBR6q//dLSc08FOoNi7F4zAtsKqZ6XTLBC2V8wg2lQ9TlZkUNId66ns
         qa1OkqzdwE5Glzbp1w7VEBuSK4ulu0vcU3F7WuVBinw2szrqj2vlOX1EWm8H58PQzXSE
         /Kb8lwxwGAVqgZr48he1lnrTTP/zKdQNKBC0X4DvlwQeW5Nhbni+/QY9MEY4GY0VQp5c
         ePFU9pRUsdfW30eVS430lXlckXmRZk94BACJL7rSJ6c2t8va7rEseDLMl5IcfPHMON3k
         lWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003987; x=1790608787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vV/yPDzhsjcBqB0No8n/B1gnDkpysOLtRQGRvwg7ZOw=;
        b=PoOkz6Pmv31dC045jjCyrJEr+/SSRnwdb7g+Z+HbeDtshjmyViyycJCsj6/urt7hi1
         UB3M1LtgyK91gpP+Bqza5hrVg8zI7wSRbIZLihmgYvznl0qYgAsVz3E7RDujzHlqArfB
         TA3DxcYhOcCPA/ryk9GhQnmu9jAMnWZcQMI/nuwolnY4hy9YPacDz97KPJzAL3YXfWRU
         Zvm8bOVsAcgqRDgW0O24imaBCrc3QZ7cSwxinDuu7wYuDDASt7Yhgbi2NebmOfYJhYPF
         GpoJ+NyhOcyIzlMuw7vD98TK4heTsNSz69WcQB5VVlVWOaehZ83dBqeLbPEWt2YVcW0y
         K0YA==
X-Forwarded-Encrypted: i=1; AKwUvBwKsI/R2+/OD8msk4t2VM4c1Xvqf94+DuYJBcH9+uuDlXLTcgajV/AqkysVpv2xSy1yDhg=@lists.linux.dev
X-Gm-Message-State: AFuF++nKz5H5WdeU91aKwiRH7cq/yGTRWJPEDAuaVgM+nQky4EbRA0Fl
	wtA/xCLJnA5sosaPE1/YOMx04tyYCDVG0QrGze3vi3RR6XnD85qzVI8Iixx9lT5V5WA=
X-Gm-Gg: AYBFou33J0HSFM0zGJppNNe1RZsqxI1mzya9QqVSHV4G/dsq+UL4FRL8V7n89hjPQdu
	NabFPmu58VFEjc0AoL39nTglxfXZ8agcqxN7s5AjshlBhzVbLzTxriHiMhh1hNMZid/T4Z5x4iP
	GIRctmW7y7qtQEIAdkmV7J03cqILHEZDChCajR3ufqACchio0RazTULSarPk/PKl2xakuv5NbT3
	EXOshCrecXj3M8dJD3E69isBvT0EMx7DE9iy/85m6eAyLKa8LuamhHijAhGPymlh10hCqOSj4Qa
	S3PHBjY7YON5runLTQq+csP9s1ENtzv3frXTlMg3nQEruhuHPTAFOfTVBYA3/LwTZzMvBwZNpUv
	l5mjSDzc3oiEmGbk1LC7kfKzhyd+mfI6u3cNWK3E5KjcS28Ln/bLNe/bufUVRe1ZOjswaJX57xM
	TSODpqoQ0wvPlCZfBQ1kn9wT2fug++aa4f94ccN1T140hGaTm0W95Tjhuv+llAjd8+PrPD/I26K
	azBPH2BGhcWKbkSfSkptDxcqXpUNQ6u6NC2mPDVLmFwX1A2qm+lFfnluP72OQ==
X-Received: by 2002:a05:6000:420a:b0:487:35c:6e6b with SMTP id ffacd0b85a97d-4871e244c95mr16766538f8f.12.1790003987507;
        Mon, 21 Sep 2026 08:19:47 -0700 (PDT)
Received: from localhost (p200300f65f19a904d4f76eed31f2ef79.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d4f7:6eed:31f2:ef79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48724591eaasm23509562f8f.26.2026.09.21.08.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:19:46 -0700 (PDT)
Date: Mon, 21 Sep 2026 17:19:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <arFKVhlgJge5EZyj@monoceros>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x3f53yyge7gbc6ag"
Content-Disposition: inline
In-Reply-To: <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>


--x3f53yyge7gbc6ag
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>=20
> SCMI client drivers already describe their bus match data with
> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> SCMI device tables. As a result, SCMI modules do not get generated module
> aliases from their id tables.
>=20
> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> visible to modpost, add the corresponding generated offsets and teach
> file2alias to emit scmi:<protocol>:<name> aliases.
>=20
> Use the same stable alias format for SCMI device uevents and sysfs
> modaliases. The previous string included the instance-specific device
> name, which is not useful for matching modules.
>=20
> Assisted-by: Codex:GPT-5.5
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes in v7:
> - Rebase on top of v7.3-rc3
>=20
> Changes in v4:
> - Drop unused driver_data member from struct scmi_device_id (Uwe)
> - Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
> - Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)
>=20
> Changes in v3:
> - Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
>   headers")
> - Add '\n' to modalias_show() output, matching other subsystems' modalias
>=20
> Changes in v2:
> - Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
> - Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8d=
d52ab2@oss.qualcomm.com
> ---
>  MAINTAINERS                       |  1 +
>  drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
>  include/linux/device-id/scmi.h    | 17 +++++++++++++++++
>  include/linux/scmi_protocol.h     |  6 +-----
>  scripts/mod/devicetable-offsets.c |  5 +++++
>  scripts/mod/file2alias.c          | 12 ++++++++++++
>  6 files changed, 46 insertions(+), 16 deletions(-)
>  create mode 100644 include/linux/device-id/scmi.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2414447892c..f351ec56a2ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26604,6 +26604,7 @@ F:	drivers/pmdomain/arm/
>  F:	drivers/powercap/arm_scmi_powercap.c
>  F:	drivers/regulator/scmi-regulator.c
>  F:	drivers/reset/reset-scmi.c
> +F:	include/linux/device-id/scmi.h
>  F:	include/linux/sc[mp]i_protocol.h
>  F:	include/trace/events/scmi.h
>  F:	include/uapi/linux/virtio_scmi.h
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/=
bus.c
> index e060edbe7e83..51de50fbc382 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -12,11 +12,12 @@
>  #include <linux/of.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/device.h>
> =20
>  #include "common.h"
> =20
> -#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
> +#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
> =20
>  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> @@ -185,7 +186,7 @@ static int scmi_protocol_table_register(const struct =
scmi_device_id *id_table)
>  	const struct scmi_device_id *entry;
>  	int ret;
> =20
> -	for (entry =3D id_table; entry->name; entry++) {
> +	for (entry =3D id_table; entry->name[0]; entry++) {
>  		ret =3D scmi_protocol_device_request(entry);
>  		if (ret)
>  			goto err_unrequest;
> @@ -205,7 +206,7 @@ scmi_protocol_table_unregister(const struct scmi_devi=
ce_id *id_table)
>  {
>  	const struct scmi_device_id *entry;
> =20
> -	for (entry =3D id_table; entry->name; entry++)
> +	for (entry =3D id_table; entry->name[0]; entry++)
>  		scmi_protocol_device_unrequest(entry);
>  }
> =20
> @@ -219,10 +220,10 @@ static int __scmi_dev_match_by_id_table(struct scmi=
_device *scmi_dev,
>  					const struct scmi_device_id *id_table,
>  					bool skip_transport)
>  {
> -	if (!id_table || !id_table->name)
> +	if (!id_table || !id_table->name[0])
>  		return 0;
> =20
> -	for (; id_table->protocol_id && id_table->name; id_table++)
> +	for (; id_table->protocol_id && id_table->name[0]; id_table++)
>  		if (id_table->protocol_id =3D=3D scmi_dev->protocol_id &&
>  		    !(skip_transport && scmi_device_is_transport(scmi_dev)) &&
>  		    !strcmp(id_table->name, scmi_dev->name))
> @@ -266,7 +267,7 @@ scmi_child_dev_find_get(struct device *parent, int pr=
ot_id, const char *name)
>  	struct device *dev;
> =20
>  	id_table[0].protocol_id =3D prot_id;
> -	id_table[0].name =3D name;
> +	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
> =20
>  	dev =3D device_find_child(parent, &id_table, scmi_match_by_id_table);
>  	if (!dev)
> @@ -300,8 +301,7 @@ static int scmi_device_uevent(const struct device *de=
v, struct kobj_uevent_env *
>  	const struct scmi_device *scmi_dev =3D to_scmi_dev(dev);
> =20
>  	return add_uevent_var(env, "MODALIAS=3D" SCMI_UEVENT_MODALIAS_FMT,
> -			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			      scmi_dev->name);
> +			      scmi_dev->protocol_id, scmi_dev->name);
>  }
> =20
>  static ssize_t modalias_show(struct device *dev,
> @@ -309,9 +309,8 @@ static ssize_t modalias_show(struct device *dev,
>  {
>  	struct scmi_device *scmi_dev =3D to_scmi_dev(dev);
> =20
> -	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
> -			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			  scmi_dev->name);
> +	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT "\n",
> +			  scmi_dev->protocol_id, scmi_dev->name);
>  }
>  static DEVICE_ATTR_RO(modalias);
> =20
> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scm=
i.h
> new file mode 100644
> index 000000000000..1b4ccfa9dcc5
> --- /dev/null
> +++ b/include/linux/device-id/scmi.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef LINUX_DEVICE_ID_SCMI_H
> +#define LINUX_DEVICE_ID_SCMI_H
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +#endif
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];

I wonder if you tried to keep this a char *. ISTR someone did something
similar recently and they claimed it worked. That would get rid of the
artificial name size limit and simplify this patch.

> +};
> +
> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..ba53302d95f5 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -9,6 +9,7 @@
>  #define _LINUX_SCMI_PROTOCOL_H
> =20
>  #include <linux/bitfield.h>
> +#include <linux/device-id/scmi.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> @@ -951,11 +952,6 @@ struct scmi_device {
> =20
>  #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
> =20
> -struct scmi_device_id {
> -	u8 protocol_id;
> -	const char *name;
> -};
> -
>  struct scmi_driver {
>  	const char *name;
>  	int (*probe)(struct scmi_device *sdev);
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-=
offsets.c
> index b4178c42d08f..91ec3704ee2b 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #define COMPILE_OFFSETS
> +#include <linux/device-id/scmi.h>
>  #include <linux/kbuild.h>
>  #include <linux/mod_devicetable.h>
> =20
> @@ -144,6 +145,10 @@ int main(void)
>  	DEVID(rpmsg_device_id);
>  	DEVID_FIELD(rpmsg_device_id, name);
> =20
> +	DEVID(scmi_device_id);
> +	DEVID_FIELD(scmi_device_id, protocol_id);
> +	DEVID_FIELD(scmi_device_id, name);
> +
>  	DEVID(i2c_device_id);
>  	DEVID_FIELD(i2c_device_id, name);
> =20
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 8d36c74dec2d..5379b1def07b 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -121,6 +121,7 @@ typedef struct {
>  /* Big exception to the "don't include kernel headers into userspace, wh=
ich
>   * even potentially has different endianness and word sizes, since
>   * we handle those differences explicitly below */
> +#include "../../include/linux/device-id/scmi.h"
>  #include "../../include/linux/mod_devicetable.h"
> =20
>  struct devtable {
> @@ -852,6 +853,16 @@ static void do_rpmsg_entry(struct module *mod, void =
*symval)
>  	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
>  }
> =20
> +/* Looks like: scmi:NN:S */
> +static void do_scmi_entry(struct module *mod, void *symval)
> +{
> +	DEF_FIELD(symval, scmi_device_id, protocol_id);
> +	DEF_FIELD_ADDR(symval, scmi_device_id, name);
> +
> +	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
> +			    protocol_id, *name);
> +}
> +
>  /* Looks like: i2c:S */
>  static void do_i2c_entry(struct module *mod, void *symval)
>  {
> @@ -1491,6 +1502,7 @@ static const struct devtable devtable[] =3D {
>  	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
>  	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
>  	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
> +	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
>  	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
>  	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
>  	{"slim", SIZE_slim_device_id, do_slim_entry},

I wonder if this is supposed to be ordered alphabetically ...

Best regards
Uwe

--x3f53yyge7gbc6ag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqxSw8ACgkQj4D7WH0S
/k5lIQf+Pk0pBFCMv2UlNFoYrcnt7sDd37qCqzSchh+C4VDUQJUrS+U3++VDP+w9
qQ1uz0pIZ08N7xrsAvI2b21w1QjBsVGfuA2K79Q66sHHNPWk2x4jLyXebehylwj7
RqUjmFBRQ6OlpZtdOfcLG0mCopgIcOa+3LMWCkac4VENvzFOQ8aHkYLCM6F8Zr3T
QHSpbWMHoPvXSbjW2ZgFDgQZbr9fVvHMcCiX1ronBbv2mqBXRzAOrjcR0IS4fqjM
0Wt+9Tibbskx3/E7EaOFar9w+dVwvg89nGCWvz9ke6FgJhqfsM9UFyz0Vv7R1kbz
gnmskjzm0NxgGlfZSipyOdiObLtMnw==
=ZEo+
-----END PGP SIGNATURE-----

--x3f53yyge7gbc6ag--
