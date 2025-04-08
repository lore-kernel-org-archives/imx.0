Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ACD1925A2
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120020; cv=none; b=Sbge7t/u99nIWQjW9ktMgoXkDrBTIW8EB4ujS3AHeFd6wKIaKCX/aVqMDM0adWJm/HLRLqb7aF6T9giTTnLtsG7k6Wv9A4at5uf9eanZgaSD0pIGTtVPBDPoxr+NUOJDA+OxwsxdSlgIVJ0TeoCJzOhMaBdxomCp2YuyfgH/TEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120020; c=relaxed/simple;
	bh=uGttsHY7G8FuWwas3u5Ct2mrcOtYZuGvhNCKUvPanfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMG3jcdpl5d/62HzdViFgunkse3WdQ2fsCQF5RUfz6/rrW8Qv56/3Em7VmEe+Wpg8eRRSkJNPfKYYsfA5XoTPFUPEos/ylOCWI88JIaPOUPBm+xd6LLuYsU+5aSGhFNTRmWFjrRGy4tjEH8T2lPYmluHUQeUgPBc9YhhJTwHbTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cT14cwGj; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cT14cwGj"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso8658593a12.0
        for <imx@lists.linux.dev>; Tue, 08 Apr 2025 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744120017; x=1744724817; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bgyLbZSexnBswDW15MI4UUpeOtwC0wIn58I5qn7B25M=;
        b=cT14cwGjZERjQoIo8oNhRvwYpPvdF9eCOYb8Y/PpkWx716o0V0oYx8jaX8SElWZdEK
         o/Qrxzws1jiZufE2x8X2xKKhhcsi6vhKEwVXdFLU8eGQhT1z3AgeDRQsDr+ciVx9uxcF
         zcKUCgZPM3k93GxuN+Z3BS81oiirnBwpd6A9+BB0LcvSvJrMUT15dda+cXuWuBhtpRWI
         U5nWLJ0JM84F4dBoy2KeH2kYCnqIICLYqxr0TkDeEYFC3VEzENaaBUE4xjCVwQCEgUfa
         G2UXvSbJIahXx5LeCNDouqsR0N0JlG/X5T2NTEMFaoDgSZpl3RAXqvvdu1yRcHtX3cAH
         IywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120017; x=1744724817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgyLbZSexnBswDW15MI4UUpeOtwC0wIn58I5qn7B25M=;
        b=wbFpwJIT04jDRoVcEFVE5O8Kaq6a98v/tH0aHz1K5XJDq0Tecik4I2C2LdkD/yxvrL
         1Odlivzq3RMQJaN/de7ql99RS8DFCeWhd++yc1ui7A9MjPtIq5WClI1WWbbEHselN9bN
         aE9L+yWMbMDki3lfxnsSXV9uQ95+TOUxf/HAJ5syy7/RZm5k74TPEfPobwanfjAvNhur
         e4zilLHg9bI87jqKtySgUZPbaG4tNIE4s/jJcO+nROWgirNiW0WKHQ4uaKyGNTtoEsUO
         bqoux7tW9I2qjyOgxNWr7Mvt2OzVRIxcKcoB7NXwGMNtkyoi+oqCr1qc1CaUP75YT4gS
         SiKw==
X-Forwarded-Encrypted: i=1; AJvYcCX75MRqG2BjnkNneGQK+h9Uhu9yzKrxo6ZcjPHJBclVWufjlV5WXE8BzvJfC/BBjknIN3c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZVdnlu13xPF6dZJxchhAPZ0Egly1N33ebV4CctpBWbWdGIpRw
	TgSpLvO0vH8M4E1PCOV31tOL89WhqaaHYdJp+BGs/9EoISLrpnjmPb52/b1CniCLRQJyQSUWfBY
	vLRkasGjRV+vx1xwYXNkCnSzhq85iXlb0H1ADNg==
X-Gm-Gg: ASbGnctthGZQSljC9NjWhxl+k9Ge+l7CE0N/2qrrS5UkM9qxePbtwNgw7WrUxBlGvn6
	LjgCk2QZRPx4RZwvfA4C6tOaYvepDCvAC6I45nXiyfBytce1XE1Sc9kjvT7GtxvA18OuXl8fVdl
	KHofi2EM89dM/7enfqLGIR9b1UahLm/22L+O7ZA0YHy9piUfhWzjTaCOCNiEA=
X-Google-Smtp-Source: AGHT+IFaA6tYh/ixqokAeN51veqxmI6baDoKuIBqp0NvCY+LdImghfFhSFlno0afKLlPeKb2PBEk5yKiA9fEgcZjpUw=
X-Received: by 2002:a05:6402:35cc:b0:5ec:fd7d:fdd5 with SMTP id
 4fb4d7f45d1cf-5f0b66314e8mr12642169a12.29.1744120016443; Tue, 08 Apr 2025
 06:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>
 <Z_P6n5wQfGuSmV2B@p14s> <29a04e57-2b41-4571-8bb9-ab3222105d8c@nxp.com>
In-Reply-To: <29a04e57-2b41-4571-8bb9-ab3222105d8c@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 8 Apr 2025 07:46:44 -0600
X-Gm-Features: ATxdqUGODn7x4BOhzuqDm2fA1myzbrI7LuEBpht_dHz_Knr0r42GIWxUl-efsI0
Message-ID: <CANLsYkzNkgNs03oaEeERxuqrxfjcp3cgs346AnTw1aeOqz5+ww@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, "S.J. Wang" <shengjiu.wang@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Mpuaudiosw <Mpuaudiosw@nxp.com>, imx@lists.linux.dev, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 02:47, Iuliana Prodan <iuliana.prodan@nxp.com> wrote:
>
> Hello Mathieu,
>
> On 4/7/2025 7:17 PM, Mathieu Poirier wrote:
> > Good morning,
> >
> > On Thu, Apr 03, 2025 at 01:01:24PM +0300, Iuliana Prodan (OSS) wrote:
> >> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> >>
> >> Some DSP firmware requires a FW_READY signal before proceeding, while
> >> others do not.
> >> Therefore, add support to handle i.MX DSP-specific features.
> >>
> >> Implement handle_rsc callback to handle resource table parsing and to
> >> process DSP-specific resource, to determine if waiting is needed.
> >>
> >> Update imx_dsp_rproc_start() to handle this condition accordingly.
> >>
> >> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> >> ---
> >> Changes in v3:
> >> - Reviews from Mathieu Poirier:
> >>    - Added version and magic number to vendor-specific resource table entry.
> >>    - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
> >>      - By default, wait for `fw_ready`, unless specified otherwise.
> >> - Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com
> >>
> >> Changes in v2:
> >> - Reviews from Mathieu Poirier:
> >>    - Use vendor-specific resource table entry.
> >>    - Implement resource handler specific to the i.MX DSP.
> >> - Revise commit message to include recent updates.
> >> - Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/
> >>
> >>   drivers/remoteproc/imx_dsp_rproc.c | 102 ++++++++++++++++++++++++++++-
> >>   1 file changed, 100 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> >> index b9bb15970966..80d4470cc731 100644
> >> --- a/drivers/remoteproc/imx_dsp_rproc.c
> >> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> >> @@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
> >>   MODULE_PARM_DESC(no_mailboxes,
> >>               "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
> >>
> >> +/* Flag indicating that the remote is up and running */
> >>   #define REMOTE_IS_READY                            BIT(0)
> >> +/* Flag indicating that the host should wait for a firmware-ready response */
> >> +#define WAIT_FW_READY                               BIT(1)
> >>   #define REMOTE_READY_WAIT_MAX_RETRIES              500
> >>
> >> +/* This flag is set in the DSP resource table's features field to indicate
> >> + * that the firmware requires the host NOT to wait for a FW_READY response.
> >> + */
> >> +#define FEATURE_DONT_WAIT_FW_READY          BIT(0)
> >> +
> >>   /* att flags */
> >>   /* DSP own area */
> >>   #define ATT_OWN                                    BIT(31)
> >> @@ -72,6 +80,10 @@ MODULE_PARM_DESC(no_mailboxes,
> >>
> >>   #define IMX8ULP_SIP_HIFI_XRDC                      0xc200000e
> >>
> >> +#define FW_RSC_NXP_S_MAGIC                  ((uint32_t)'n' << 24 |  \
> >> +                                             (uint32_t)'x' << 16 |  \
> >> +                                             (uint32_t)'p' << 8 |   \
> >> +                                             (uint32_t)'s')
> >>   /*
> >>    * enum - Predefined Mailbox Messages
> >>    *
> >> @@ -136,6 +148,24 @@ struct imx_dsp_rproc_dcfg {
> >>      int (*reset)(struct imx_dsp_rproc *priv);
> >>   };
> >>
> >> +/**
> >> + * struct fw_rsc_imx_dsp - i.MX DSP specific info
> >> + *
> >> + * @len: length of the resource entry
> >> + * @magic_num: 32-bit magic number
> >> + * @version: version of data structure
> >> + * @features: feature flags supported by the i.MX DSP firmware
> >> + *
> >> + * This represents a DSP-specific resource in the firmware's
> >> + * resource table, providing information on supported features.
> >> + */
> >> +struct fw_rsc_imx_dsp {
> >> +    uint32_t len;
> >> +    uint32_t magic_num;
> >> +    uint32_t version;
> >> +    uint32_t features;
> >> +} __packed;
> >> +
> >>   static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
> >>      /* dev addr , sys addr  , size      , flags */
> >>      { 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
> >> @@ -300,6 +330,73 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
> >>      return -ETIMEDOUT;
> >>   }
> >>
> >> +/**
> >> + * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
> >> + * @rproc: remote processor instance
> >> + * @rsc_type: resource type identifier
> >> + * @rsc: pointer to the resource entry
> >> + * @offset: offset of the resource entry
> >> + * @avail: available space in the resource table
> >> + *
> >> + * Parse the DSP-specific resource entry and update flags accordingly.
> >> + * If the WAIT_FW_READY feature is set, the host must wait for the firmware
> >> + * to signal readiness before proceeding with execution.
> >> + *
> >> + * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
> >> + */
> >> +static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
> >> +                                void *rsc, int offset, int avail)
> >> +{
> >> +    struct imx_dsp_rproc *priv = rproc->priv;
> >> +    struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
> >> +    struct device *dev = rproc->dev.parent;
> >> +    size_t expected_size;
> >> +
> >> +    if (!imx_dsp_rsc) {
> >> +            dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
> >> +            goto ignored;
> >> +    }
> >> +
> >> +    /* Make sure resource isn't truncated */
> >> +    expected_size = imx_dsp_rsc->len + sizeof(imx_dsp_rsc->len);
> > Something seems odd with this check... I don't see how adding
> > imx_dsp_rsc->len with 4 will give us any indication of the expected size.
> The fw_rsc_imx_dsp structure is based on Zephyr and OpenAMP ([1]).
>
> The imx_dsp_rsc->len indicates the available resource size. Adding 4
> bytes (for uint32_t len member) gives the total structure size. If this
> does not match sizeof(struct fw_rsc_imx_dsp), the structure is incomplete.
>

Ok, but why is adding 4 to imx_dsp_rsc->len needed?  Why doesn't
imx_dsp_rsc->len already contain the right size?

The size of struct fw_rsc_imx_dsp is 16 byte.  From your
implementation, it seems like ->len is equal to 12 and 4 needs to be
added to make it 16.  To me ->len should be 16... What am I missing?

> I will also verify with avail and send a v4.
>
> [1]
> https://github.com/OpenAMP/open-amp/blob/main/lib/include/openamp/remoteproc.h#L356
>
> Thanks,
> Iulia
> >   To me
> > two checks are required here:
> >
> > 1) if (sizeof(*rsc) > avail)
> >
> > 2) if (sizeof(*rsc) != imx_dsp_rsc->len)
> >
> > Otherwise I'm good with this new revision.
> >
> > Thanks,
> > Mathieu
> >
> >> +    if (expected_size < sizeof(struct fw_rsc_imx_dsp)) {
> >> +            dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
> >> +            goto ignored;
> >> +    }
> >> +
> >> +    /*
> >> +     * If FW_RSC_NXP_S_MAGIC number is not found then
> >> +     * wait for fw_ready reply (default work flow)
> >> +     */
> >> +    if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
> >> +            dev_dbg(dev, "Invalid resource table magic number.\n");
> >> +            goto ignored;
> >> +    }
> >> +
> >> +    /*
> >> +     * For now, in struct fw_rsc_imx_dsp, version 0,
> >> +     * only FEATURE_DONT_WAIT_FW_READY is valid.
> >> +     *
> >> +     * When adding new features, please upgrade version.
> >> +     */
> >> +    if (imx_dsp_rsc->version > 0) {
> >> +            dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
> >> +                     imx_dsp_rsc->version);
> >> +            goto ignored;
> >> +    }
> >> +
> >> +    if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
> >> +            priv->flags &= ~WAIT_FW_READY;
> >> +    else
> >> +            priv->flags |= WAIT_FW_READY;
> >> +
> >> +    return RSC_HANDLED;
> >> +
> >> +ignored:
> >> +    priv->flags |= WAIT_FW_READY;
> >> +    return RSC_IGNORED;
> >> +}
> >> +
> >>   /*
> >>    * Start function for rproc_ops
> >>    *
> >> @@ -335,8 +432,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
> >>
> >>      if (ret)
> >>              dev_err(dev, "Failed to enable remote core!\n");
> >> -    else
> >> -            ret = imx_dsp_rproc_ready(rproc);
> >> +    else if (priv->flags & WAIT_FW_READY)
> >> +            return imx_dsp_rproc_ready(rproc);
> >>
> >>      return ret;
> >>   }
> >> @@ -936,6 +1033,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
> >>      .kick           = imx_dsp_rproc_kick,
> >>      .load           = imx_dsp_rproc_elf_load_segments,
> >>      .parse_fw       = imx_dsp_rproc_parse_fw,
> >> +    .handle_rsc     = imx_dsp_rproc_handle_rsc,
> >>      .find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> >>      .sanity_check   = rproc_elf_sanity_check,
> >>      .get_boot_addr  = rproc_elf_get_boot_addr,
> >> --
> >> 2.25.1
> >>
