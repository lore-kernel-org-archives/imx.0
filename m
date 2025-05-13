Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454BF1EB1B5
	for <imx@lists.linux.dev>; Tue, 13 May 2025 21:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747170351; cv=none; b=MHyAwAaIqlCKDnbYGKSckFpGIbbmxHVS2gu2aX4NGpJr/1CkI+tNNqLY8xEuvNZbB3Spk+GEaTMLtwOX+WRyWBNNg6zWUQbpnW5LFino+QyRScF6oWZcrB0N7EiE9bXnPLXOTlM6+Sd5X9TOwz3Kl1cAk9Nr+LjcevWvVxZqQA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747170351; c=relaxed/simple;
	bh=jprtOsgVW2F9aVvUz6IyNAsOxzDylpa9XA6Aj2LsBB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTkSv4wLsix10uDn8g5JfTwQFylLw2/dcNT1o3EvwI5ANpVpJ84swyXDq5SotfG/vTurB4b3FtjJxGBZZgVldyK+Ji5P9m+9y4UKf6ZzLkG+bx38Dq7XRO6Mh4rb4IdVBk0Uyiz3XPgpBMCECARTyggxw0RB/ivgSopRJj9OfyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhPBjk3A; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhPBjk3A"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4ddb4b29fe7so4507079137.1
        for <imx@lists.linux.dev>; Tue, 13 May 2025 14:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747170348; x=1747775148; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PF/f05Jnn8cBIgm4MkrIADKbDArlZkrF9k16SO3CXK4=;
        b=bhPBjk3A9Ygr42/EB/QWEY+inq5paTsu06T+DRkR8xxRVWa/pzEspouMwASbKk7S+X
         3QOqswrNJJgAlWccmhrKtQf8DInyRpDJNy8LKQQ0XtsgRp9/5DbTm7eWtenrSRpvAjul
         KOLu1vEdEPmzZbSaDwWQ6UDhwm5ktcZJLKhoHg7O3owfruP5sXhUffV1uGUzkhFJ00vB
         3gHs/IJ8Cq4uNQpG4RrppI7E/2WyuYOWXPymyzmQtffSCvQdT16mvyhVjNb0HcyVgtbj
         FEavxxDbS1h6v3YfFOvL9WvshXUGiKNcgZ6mMwTlDUmy4aBsjoGYIiKXwpth2yNi10gP
         BanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747170348; x=1747775148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF/f05Jnn8cBIgm4MkrIADKbDArlZkrF9k16SO3CXK4=;
        b=Jog4iaWEhm0EbiTO8AooqxQQ6D/u6DNN9xqOUNZ1Pdr/0TkcAEF2qu+xJ3YGEtKcif
         n32+0TtER0t3x7g34FpG1f9qKl1ylW04gKjOMD3VTpSiHfkYHWYsNlh/IOXh6ukJtfWk
         oDVNkyBrCYTmSF7CoYnYKLSq4FxZ0RW0+hZ4Jhn7bjiIezn/Bicr3JvJy4L72dRbOeyS
         KyhTTymTKXh1eRD8mi0HIq0QtHTX1j1KxtqJfjbOb9Fx3yaXze2KB6YK2ah3UxV4q7Jn
         nXbl75BDFg9UXL709CDYnA0vu1FRkBUK1JxhL4SjelVanhgLwmEbf+ZboCWBPniahZdM
         fpFw==
X-Forwarded-Encrypted: i=1; AJvYcCWwC2o7vaH0Gz0XT+6wiki3kRJDcz+TchMH9h622k5hyCUVvCqzIMeGtGaRR87a5DlXvJs=@lists.linux.dev
X-Gm-Message-State: AOJu0YypWDbHoJtJtTGq+0MGXsQX9J/47LITVUQCCKCJsvm1EUvyurj7
	dUCJP4GbATOLnAE38mxYYNzihTnDf9b4bp1FFMQM1jbY/56CNBxr
X-Gm-Gg: ASbGnctJbLMvweo7XmSQ7cG3pzCl9hkxoSturkAsPUJFbki8r8Mkwxu7dCZz3+Lg4HY
	HjnEj/6gPBy1syu0QaFMFrjaH4awRbDd/hQwEHwU7jYH8MFrU1viF3rFgKi7DLiT0W/5wDHZyAU
	XR4KVM7Q79lzruB7+fiIyGZFYZABtdEA31S6a8LJHX10XIqev5sywdAZJlDGYMHAmuvieqnoKMX
	+YNRS1jzoCDrfrXcrn5UwrKDRlrzaJ6yFioUpRXOQZCatVIrWw4op+7H/fnLHf5kbTUL36HP48u
	p34mzpPpd2nSgVELOPQIGeAizjqZXrkEGs88bR0RuVSbDv6AUQ==
X-Google-Smtp-Source: AGHT+IGxvFdQRn97UaiBY7c/whlkImXIkzkXz6uwmHgp7GwxfHPgSbQVCxBX8oQoHlKhKWt+naoXiA==
X-Received: by 2002:a05:6102:948:b0:4c3:6544:c250 with SMTP id ada2fe7eead31-4df7ddf92ecmr1108581137.23.1747170347966;
        Tue, 13 May 2025 14:05:47 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6139e8csm7562202241.2.2025.05.13.14.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:05:47 -0700 (PDT)
Date: Tue, 13 May 2025 18:05:41 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] firmware: imx: move get power mode function from
 scu-pd.c to misc.c
Message-ID: <20250513210541.f6ptdxq5ocni3bp3@hiago-nb>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
 <20250507160056.11876-2-hiagofranco@gmail.com>
 <20250513073822.GA14572@nxa18884-linux>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513073822.GA14572@nxa18884-linux>

Hi Peng,

On Tue, May 13, 2025 at 03:43:37PM +0800, Peng Fan wrote:
> Hi Hiago,
> 
> On Wed, May 07, 2025 at 01:00:54PM -0300, Hiago De Franco wrote:
> >From: Hiago De Franco <hiago.franco@toradex.com>
> >
> >Move imx_sc_get_pd_power() from pmdomain/imx/scu-pd.c to
> >firmware/imx/misc.c and rename it to imx_sc_pm_get_resource_power_mode()
> >to maintain the same naming logic with other functions in misc.c.
> >
> >This makes the API available for other use cases. For example,
> >remoteproc/imx_rproc.c can now use this function to check the power mode
> >of the remote core.
> >
> >Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >---
> >v2: moved this patch to be the first one
> >---
> > drivers/firmware/imx/misc.c           | 47 +++++++++++++++++++++++++++
> > drivers/pmdomain/imx/scu-pd.c         | 29 ++++-------------
> > include/linux/firmware/imx/svc/misc.h |  8 +++++
> > 3 files changed, 62 insertions(+), 22 deletions(-)
> >
> >diff --git a/drivers/firmware/imx/misc.c b/drivers/firmware/imx/misc.c
> >index d073cb3ce699..61fcb0066ec9 100644
> >--- a/drivers/firmware/imx/misc.c
> >+++ b/drivers/firmware/imx/misc.c
> >@@ -37,6 +37,18 @@ struct imx_sc_msg_resp_misc_get_ctrl {
> > 	u32 val;
> > } __packed __aligned(4);
> > 
> >+struct imx_sc_msg_req_get_resource_power_mode {
> >+	struct imx_sc_rpc_msg hdr;
> >+	union {
> >+		struct {
> >+			u16 resource;
> >+		} req;
> >+		struct {
> >+			u8 mode;
> >+		} resp;
> >+	} data;
> >+} __packed __aligned(4);
> >+
> > /*
> >  * This function sets a miscellaneous control value.
> >  *
> >@@ -135,3 +147,38 @@ int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
> > 	return imx_scu_call_rpc(ipc, &msg, true);
> > }
> > EXPORT_SYMBOL(imx_sc_pm_cpu_start);
> >+
> >+/*
> >+ * This function gets the power mode from a given @resource
> >+ *
> >+ * @param[in]     ipc         IPC handle
> >+ * @param[in]     resource    resource to check the power mode
> >+ *
> >+ * @return Returns < 0 for errors or the following for success:
> >+ * IMX_SC_PM_PW_MODE_OFF  0	Power off
> >+ * IMX_SC_PM_PW_MODE_STBY 1	Power in standby
> >+ * IMX_SC_PM_PW_MODE_LP   2	Power in low-power
> >+ * IMX_SC_PM_PW_MODE_ON   3	Power on
> >+ *
> >+ * These are defined under firmware/imx/svc/pm.h
> >+ */
> >+int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc, u32 resource)
> >+{
> >+	struct imx_sc_msg_req_get_resource_power_mode msg;
> >+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
> >+	int ret;
> >+
> >+	hdr->ver = IMX_SC_RPC_VERSION;
> >+	hdr->svc = IMX_SC_RPC_SVC_PM;
> >+	hdr->func = IMX_SC_PM_FUNC_GET_RESOURCE_POWER_MODE;
> >+	hdr->size = 2;
> >+
> >+	msg.data.req.resource = resource;
> >+
> >+	ret = imx_scu_call_rpc(ipc, &msg, true);
> >+	if (ret)
> >+		return ret;
> >+
> >+	return msg.data.resp.mode;
> >+}
> >+EXPORT_SYMBOL(imx_sc_pm_get_resource_power_mode);
> >diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
> >index 01d465d88f60..945f972e636f 100644
> >--- a/drivers/pmdomain/imx/scu-pd.c
> >+++ b/drivers/pmdomain/imx/scu-pd.c
> >@@ -54,6 +54,7 @@
> > #include <dt-bindings/firmware/imx/rsrc.h>
> > #include <linux/console.h>
> > #include <linux/firmware/imx/sci.h>
> >+#include <linux/firmware/imx/svc/misc.h>
> > #include <linux/firmware/imx/svc/rm.h>
> > #include <linux/io.h>
> > #include <linux/module.h>
> >@@ -328,27 +329,6 @@ static void imx_sc_pd_get_console_rsrc(void)
> > 	imx_con_rsrc = specs.args[0];
> > }
> > 
> >-static int imx_sc_get_pd_power(struct device *dev, u32 rsrc)
> >-{
> >-	struct imx_sc_msg_req_get_resource_power_mode msg;
> >-	struct imx_sc_rpc_msg *hdr = &msg.hdr;
> >-	int ret;
> >-
> >-	hdr->ver = IMX_SC_RPC_VERSION;
> >-	hdr->svc = IMX_SC_RPC_SVC_PM;
> >-	hdr->func = IMX_SC_PM_FUNC_GET_RESOURCE_POWER_MODE;
> >-	hdr->size = 2;
> >-
> >-	msg.data.req.resource = rsrc;
> >-
> >-	ret = imx_scu_call_rpc(pm_ipc_handle, &msg, true);
> >-	if (ret)
> >-		dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> >-			rsrc, ret);
> >-
> >-	return msg.data.resp.mode;
> >-}
> >-
> > static int imx_sc_pd_power(struct generic_pm_domain *domain, bool power_on)
> > {
> > 	struct imx_sc_msg_req_set_resource_power_mode msg;
> >@@ -438,7 +418,12 @@ imx_scu_add_pm_domain(struct device *dev, int idx,
> > 	if (imx_con_rsrc == sc_pd->rsrc)
> > 		sc_pd->pd.flags = GENPD_FLAG_RPM_ALWAYS_ON;
> > 
> >-	mode = imx_sc_get_pd_power(dev, pd_ranges->rsrc + idx);
> >+	mode = imx_sc_pm_get_resource_power_mode(pm_ipc_handle,
> 
> I mean, not change scu-pd.c in this patchset. After
> imx_sc_pm_get_resource_power_mode landed, you could update scu-pd.c.
> 
> Otherwise you are touch three trees which are a bit hard to manage for
> maintainers:
> scu-pd.c under linux-pm tree
> misc.c under linux-imx tree, I think using power.c should be better.
> imx_rproc.c under linux-remoteproc tree
> 
> My suggestion was that
> patch 1: firmware: imx: Introduce imx_sc_pm_get_resource_power_mode
> patch 2: remoteproc: imx_rproc: Detecting power mode of M4 for i.MX8QX
> Patch 3: pmdomain: scu-pd: migrate to use imx common pm API
> 
> Patch 3 could be separate out in future patchset to avoid handling three trees.

Ok, got it. I will prepare the v3 with your suggestions. Thanks.

> 
> Regards,
> Peng
> >+						 pd_ranges->rsrc + idx);
> >+	if (mode < 0)
> >+		dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> >+			pd_ranges->rsrc + idx, mode);
> >+
> > 	if (mode == IMX_SC_PM_PW_MODE_ON)
> > 		is_off = false;
> > 	else
> >diff --git a/include/linux/firmware/imx/svc/misc.h b/include/linux/firmware/imx/svc/misc.h
> >index 760db08a67fc..376c800a88d0 100644
> >--- a/include/linux/firmware/imx/svc/misc.h
> >+++ b/include/linux/firmware/imx/svc/misc.h
> >@@ -55,6 +55,8 @@ int imx_sc_misc_get_control(struct imx_sc_ipc *ipc, u32 resource,
> > 
> > int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
> > 			bool enable, u64 phys_addr);
> >+
> >+int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc, u32 resource);
> > #else
> > static inline int imx_sc_misc_set_control(struct imx_sc_ipc *ipc,
> > 					  u32 resource, u8 ctrl, u32 val)
> >@@ -73,5 +75,11 @@ static inline int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
> > {
> > 	return -ENOTSUPP;
> > }
> >+
> >+static inline int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc,
> >+						    u32 resource)
> >+{
> >+	return -ENOTSUPP;
> >+}
> > #endif
> > #endif /* _SC_MISC_API_H */
> >-- 
> >2.39.5
> >

Best Regards,
Hiago.
