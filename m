Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987763F7A94
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926653; cv=none; b=ngZb1Sz4XXFMF2DFFez0yU+tICYAD7VVHam0Ei8hg5p1WeVQUU+lI+sB20rIEdIW9Bp7PYEpwxlvRnYyBEzqlxloGfXimGuapDEw+JzoPl1cRONYSYD6n/zF6txn6cLyKsVZciST833WPhackbMLbk3AbhziVnUlC6kIIzkerus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926653; c=relaxed/simple;
	bh=yJGjr7t9t7O+UQoPuUHbFVzrG50epe0V1aWsqXR/uLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gyz7o5Rfjl8W+Ohk1Q0SU6N/4FMJvvCcZC0eO1IcOX5dytUKmzJhn6/SSCOs49shVe9Qq9DnTinT5C9emC2fbFmuzVQVlJEfa3ZpUbqrmx5s2eyiE4UXlREScSj89pjDUOF2F30MsKWCx/Afpb6t7SFa3UzvBNMuaEpRzg/VVPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QQLk0p3J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QQLk0p3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785926650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VBLPmYrNwyqCULYKtthS+JHQCLS3nMPhwf7QeBH1JBU=;
	b=QQLk0p3JcKiB2fiVfd1Y7A6SlAR6Wf0kgKXsD8kWUC5YUGZydX/EsvZOXENSXdM4ouQauY
	hJJK3mACBfwSjzpQ20vii9XwMIN41G8M5x+jspPu3mwajEovGoSc/P6612pUNzAWh0qcva
	hahevqkD0AwkKkUb91EyewDhpGuj/10=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-Y6ARYIQSOmivFCXGdGo8jg-1; Wed, 05 Aug 2026 06:44:09 -0400
X-MC-Unique: Y6ARYIQSOmivFCXGdGo8jg-1
X-Mimecast-MFC-AGG-ID: Y6ARYIQSOmivFCXGdGo8jg_1785926649
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81f0b6bb02dso23069477b3.3
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 03:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926649; x=1786531449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBLPmYrNwyqCULYKtthS+JHQCLS3nMPhwf7QeBH1JBU=;
        b=cOPXbUB3JMMGYC8YurBl0fPBz8sutvybDoB7FNobamB8dJyuhs3JiZJYK3O8OyE4F1
         EfiDZJwOLQJQtXHNOnFXPdVMRwaQIcmWHJcRzb1m0R+u5/tMYlGEf+u3YmV+x2JF6H03
         9+ULH7Pf8z0PpcKlxh5VmKI4Lbp3KE5kaaEY0ow7Gl0WfdZLdne2FSRSyvXDnD6AaRmm
         bxVOD1YBAPkL0Hx4W/OJzY3Q9c5E1XPAjuqGKglPMWZrBns2RQTO2Rne+IKUMz5UB5rf
         fLrjtxvePUUyCvkwV3tRFTaW71OklqC1uqX6Qki7UcE1oR/LRNdrfygz4kCIEZ/QdtRK
         SnOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq90b2FFvw+3u85JEI83ZVoa4UFiGnyCfcUc9rTLz05k2TGBKpbt0/4DsXmqtJM7Rc8Fhg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCNc4Ff2OsPu998p+ZzwoGLUsbqaPlbzJc9janTs3vgQbD1iyR
	cjrDF7P31caJ3o7OaDjGSBjYfj6cyrD6vfwTBdVCa+0Z6TyRy6Nd6q0zR27UeTdsRd7iL30mi3v
	ttI2FA8zr3xnfxVYpJmuArw7HUCaVEMWcbyKRIAqci9cYtUZyEGLly137j3vnqKhm+YF+8pYLe/
	Ys3o+ea9JH7ktfQx5tECCmUkDpKTIv
X-Gm-Gg: AR+sD11h73T+ZQiIguxliHDH8Y0HFATadlhNJclO4Ju18apuIA1Z9vjnyQgDAGnGhfI
	TEM8yGWpCcDlSdlFg1iEairWXocnxXi4qg9mWbgaoNgPnx03mgRyEV7qFPTj731KtDfp/gBosME
	mrFnqRcIk4zCKj353cgp/uT0513oriZnHQaBwwJHD4YNYzzB4SF4HW1eA=
X-Received: by 2002:a05:690c:4d02:b0:80d:964f:88fd with SMTP id 00721157ae682-8201f0c14a8mr34577987b3.5.1785926648646;
        Wed, 05 Aug 2026 03:44:08 -0700 (PDT)
X-Received: by 2002:a05:690c:4d02:b0:80d:964f:88fd with SMTP id
 00721157ae682-8201f0c14a8mr34577737b3.5.1785926648209; Wed, 05 Aug 2026
 03:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
In-Reply-To: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 5 Aug 2026 12:43:57 +0200
X-Gm-Features: AUfX_mzIqL0xVaQ870Pw0RFXK5xY2ZBOqREaUxjUjBjO8iIwCsGBLuNH2W3gAs8
Message-ID: <CADSE00K71ke8yXv8xxJ=e68kqPQAjXiOw1kY_BFpTsfw=xiJaw@mail.gmail.com>
Subject: Re: [PATCH] drm: fix missing header include for drm_panel_put()
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QGLxZTpFuC6OKllafyhLr2yIf1DlPDJHnhlfTzltyRk_1785926649
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Wed, Jul 22, 2026 at 12:07=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Some DRM drivers lacked the drm_panel.h include to use drm_panel_put()
> after the commit b71a623598d3 ("drm/panel: of_drm_find_panel() return a c=
ounted reference").
>
> Fixes: b71a623598d3 ("drm/panel: of_drm_find_panel() return a counted ref=
erence")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Oops, I missed building on my last revision. Thanks for taking care of
this and sorry for the inconvenience.

BR,
Albert.

> ---
>  drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c   | 1 +
>  drivers/gpu/drm/stm/ltdc.c          | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dc=
ss/dcss-kms.c
> index 01e0c10b6ea1..7c5a6e2bc89a 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -13,6 +13,7 @@
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mx=
sfb_drv.c
> index 7cb19c15bf39..8b4a500347fb 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -29,6 +29,7 @@
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_module.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index daf198edb42f..8818dcf98da7 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -34,6 +34,7 @@
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>
> ---
> base-commit: 0f065acf44aeb8c32691d88cc87004fd2e54e902
> change-id: 20260722-panel-fix-kms-panel-put-38c079412f83
>
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
>

