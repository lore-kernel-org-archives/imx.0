Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2EA3C7DEB
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062883; cv=pass; b=YxG4dnIN29J2Csf6zUfMSQtD3VgfpIO0cZEhPyvJioC+A1L2KfAMt1n8Th8qs+/vwqjdGzyIoL2I1Qv4ippUVZFTvTZbR4N51Qc/0u5PF9qLkfHynZBwtMyZkKl/YxPPsla9ETlUdicqFFnKNIy5OqD9AX6RB0ye2ZQf26MsTkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062883; c=relaxed/simple;
	bh=8dO5H5NH2RszZryttcomG76BD17kGA9isNzAWX9CjXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhnduBS6zGc8VzQERWNOTADSswoqTmdMgmIrq0Jw3yKjfZcSJuCMzeY625jFGTJDWRmHB6vHWUgb1Xqlmnmzk9IFFJMjiVt6fWCKuzIVF6KloWucbbCS+wMUDpox6Cs4hp7PQNWD9o3Y3WslbtyUzCPCzCj5oaI1c3d43+QV67A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+o/npwv; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+o/npwv"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85e68bdbcc1so27797647b3.2
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 00:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790062881; cv=none;
        d=google.com; s=arc-20260327;
        b=hPOOaqCtZQ46317eA1T1fsP2TLujGeqjwMECyKq6jHE69szGSqkViklrpLexLr4HAs
         4EJ3QgbL5LdGt9i7AOF0f+wIShC98rFx55jNowcRYh+rY3DUZd/t/rMyzAmE2FkrZj+g
         2+e3Dkk2OZvzuwn+UVsVMEzDRMcLSUfy1lVRvAFck6ekDZOFLCeQSn8FlbouLrLyCbeO
         o6RU/e9fbNV76XE0xb4qDTvcLpuzF5jO1vhv8cyoVIPiiQ1SLiDp6DZmclv3XQ/6HS/g
         SWyaFe21HG8pVLz/3KXgWbYRBLvx7oGQsOiwcDWX/uV/YhwHS7qc84DlrQhuMi1UrDaE
         yjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=io8UjoxhH2lPg3HQUAyI0U/34+pkdRwtw5UyaKVMvYA=;
        fh=rJTml7FglU0XbSI6xM1dKCMsURUwQ9JQ8j4aFexwJnU=;
        b=LQY5fapSYNmChZ8QJ8XvMxeuxzi/t0OeTD6F+F+5svlwJf3qC+viO/URL/K7u30VWf
         QByO+AAUNAWZmSifpGZGWlE8DchFpZ0gn1roxLS3e9rSGTtM/nooUD6rfzgM3Jj2M1y6
         orMcJ8NF3wurbxS0ABQyVu84G7AjwtbdpV9N0ATWXjrOQa+w9Z0y7mu4W5JkFtpwWXEv
         J4M7zb4dfzDTAgjOzqE7uzywNFk+0PIQgk9XtqvzKa0zhLIm56fpFKFPl3yD78x/sVHN
         ADyJcjSHai0NGM+nNoR3UVIykIpXK2FPhgal3vs0jwwqfNiauN0L1VF/q3WXXi/Sj+as
         dm0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790062881; x=1790667681; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=io8UjoxhH2lPg3HQUAyI0U/34+pkdRwtw5UyaKVMvYA=;
        b=Y+o/npwv8TyVRrm1mNchoRGOonGKxD//PURBJdVUV82g7Nm3lLJSr9XbT5zsdw5gln
         4RJfXPVFcuIPqWOi6fo7qJQTz+wzqRGk6CKhUCFg2xGD0NzmdEkuhTn98UloUNnol0u1
         Qd7WFQGDklw2xepONpHGhd/Gtf7YAD4YFSZgD2vNrj6NC92s5UnR0dE1NPCVLXm56zH9
         3klyOyTDmpCHoWlcSMppxbNgDpeTM3hNdwiCMVSeWwvtn+Nv0+UyXxYUP9pf6nD0ZG46
         l1JpAGEP7fgD1EVET617cF5gILK81dejoNgCSHhMLJ+gX+uu5A/3v6u+LpjfwcjcBV+6
         UCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062881; x=1790667681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=io8UjoxhH2lPg3HQUAyI0U/34+pkdRwtw5UyaKVMvYA=;
        b=Jliiu486S7qffQCLW4cEMBpNuKpe+KK01mFj9uO9D+B7cmt+ThRBSCcfSKPUPOXMIH
         uMSuRWhgae+tVZr4DGl4htFn32cS91PUyTM8r9mKSmRX3SB4Lqfun5yE7nhUMIDPfY9N
         GFQmsw7IJaQdyguReyxWAIAvVH/MiNP1rBWKUvNIEBSAEl+QKSAtk0Y4RTFxU/kxd+Od
         Jag/GZU0TVACdSC4tkORIp+L3vApxTMjjdB9muT2RuBM+zYydt/z7rl1J6JRfj5Kt6PZ
         E0lvQbsehfbBwpJHgpjCOaf2b9TTp2D6L8u06RtspylyHozsNm9FS5OzEl9OSGlvXlQp
         4pNA==
X-Forwarded-Encrypted: i=1; AKwUvByNi+BjsykoEBYoRTJwZkwOZjw2g0Jf4/rQCoFuqvSe17jjM+ChmALFHibDmUmSO/L/JQk=@lists.linux.dev
X-Gm-Message-State: AFuF++ktXrYlsMIML0mOGDgDLT3DSV35qbamkrH13yJ2LT8l6KUvYN4c
	PxziaTZB37hpPbt62fs8QdHY0cWIBfbhPVozDzqJy4h2dl41pzulnZJoFhPgASFLOMrG4yFKR+I
	27RnS/P/uh3kkVNHmeUoegsiI0tHm29I=
X-Gm-Gg: AYBFou2+ELDS3JHpV1VzwvQrGBIRq12kSZ5ys0V19NdcTZAntzyLnHmtFytK2PtKZJZ
	alXTdtw85sPcnCZPz+JjIptE+jBTU99WhyCO6b9v3K2nPYKNBAZ8e5SOQc2CtKP88ahCF5p8bPG
	fFQ82RKPSgqxP4aIPMb74Ym0JnPJ3J0KvEaGKUwyAPzdcIkrUDaQnzf8DvSMDppizomw14AScJo
	uKJ1lnHp7joP1JdaTCA4sMA6vNQPtOJ9kDYKKQZKID7rFnI03kRULuWaQ7n8qnNWxaoAhSB6nlH
	j8InS3idBm7Byult+5t0nQmAGIs8fi0qJwTq4xnxKLU5kJZlGMrOJjKnLg==
X-Received: by 2002:a05:690e:1913:b0:66d:2cd9:91d with SMTP id
 956f58d0204a3-6717fd6bd3amr4742587d50.50.1790062880773; Tue, 22 Sep 2026
 00:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918031323.3376849-1-lgs201920130244@gmail.com> <aqzqvfbeh653jUce@ashevche-desk.local>
In-Reply-To: <aqzqvfbeh653jUce@ashevche-desk.local>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 15:41:07 +0800
X-Gm-Features: AcwNN1VuZPbV3cKT7eLyi5Ad-zawrqaD9RbQUP_M-BL5VAYRTq9TxG7WFCvCE54
Message-ID: <CANUHTR9ipEFUGteK4TTpnpN0yUmxjop1v783aOhyq6AE9cwO0A@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: gpc: remove all initialized power domains
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wentao Liang <vulab@iscas.ac.cn>, 
	Miaoqian Lin <linmq006@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

  Hi Andy,

 Thanks for the review.

On Fri, 18 Sept 2026 at 15:39, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 18, 2026 at 11:13:22AM +0800, Guangshuo Li wrote:
> > imx_gpc_old_dt_init() initializes all power domains described by
> > of_id_data->num_domains. Its probe failure path removes all of these
> > domains, but imx_gpc_remove() only removes the PU and ARM domains.
> >
> > On SoCs with more than two domains, such as i.MX6SL and i.MX6SX, the
> > additional DISPLAY and PCI generic power domains can remain registered
> > after the GPC driver is removed.
> >
> > Remove all initialized power domains in reverse order. Keep releasing
> > the PU clocks immediately after the PU domain has been successfully
> > removed.
> >
> > This issue was found by manual code inspection.
>
> ...
>
> >  static void imx_gpc_remove(struct platform_device *pdev)
> >  {
> > +     const struct imx_gpc_dt_data *of_id_data =
> > +             device_get_match_data(&pdev->dev);
>
> No...
>
> >       struct device_node *pgc_node;
> > -     int ret;
> > +     int i, ret;
>
> ...and no.
>
> The result of the device_get_match_data() better to be checked, in some cases
> it might lead to NULL dereference.
>
> It's better to split semantically different variables, also naming 'i' is not
> good, num_domains is better. Besides that, why is it signed?
>
> ...
>
> > +             for (i = of_id_data->num_domains - 1; i >= 0; i--) {
>
> What you are doing here can be written in a shorter form
>
>                 num_domains = of_id_data->num_domains;
>                 while (num_domains--) {
>
> > +                     ret = pm_genpd_remove(&imx_gpc_domains[i].base);
> > +                     if (ret) {
> > +                             dev_err(&pdev->dev,
> > +                                     "Failed to remove %s power domain (%pe)\n",
> > +                                     imx_gpc_domains[i].base.name,
> > +                                     ERR_PTR(ret));
> > +                             return;
> > +                     }
> >
> > +                     if (i == GPC_PGC_DOMAIN_PU)
> > +                             imx_pgc_put_clocks(&imx_gpc_domains[i]);
> >               }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
How about this:

 static void imx_gpc_remove(struct platform_device *pdev)
 {
+       const struct imx_gpc_dt_data *of_id_data;
        struct device_node *pgc_node;
-       int ret;
+       unsigned int num_domains;
+       int ret;

        pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");

        ...

        if (!pgc_node) {
                of_genpd_del_provider(pdev->dev.of_node);

-               ret = pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_PU].base);
-               if (ret) {
-                       dev_err(&pdev->dev, "Failed to remove PU power
domain (%pe)\n",
-                               ERR_PTR(ret));
-                       return;
-               }
-               imx_pgc_put_clocks(&imx_gpc_domains[GPC_PGC_DOMAIN_PU]);
+               of_id_data = device_get_match_data(&pdev->dev);
+               if (!of_id_data)
+                       return;

-               ret =
pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_ARM].base);
-               if (ret) {
-                       dev_err(&pdev->dev, "Failed to remove ARM
power domain (%pe)\n",
-                               ERR_PTR(ret));
-                       return;
+               num_domains = of_id_data->num_domains;
+               while (num_domains--) {
+                       ret =
pm_genpd_remove(&imx_gpc_domains[num_domains].base);
+                       if (ret) {
+                               dev_err(&pdev->dev,
+                                       "Failed to remove %s power
domain (%pe)\n",
+                                       imx_gpc_domains[num_domains].base.name,
+                                       ERR_PTR(ret));
+                               return;
+                       }
+
+                       if (num_domains == GPC_PGC_DOMAIN_PU)
+
imx_pgc_put_clocks(&imx_gpc_domains[num_domains]);
                }
        }

Does this look OK to you? If so, I'll send a v2.

Thanks,
Guangshuo
