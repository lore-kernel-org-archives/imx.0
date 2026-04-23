Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E2E35C1BC
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 20:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776977682; cv=none; b=KnVgZ3lNGWksplNcUW4ypdm4cA8i+ewYboFR6oMkUrU7ovLT6nIs4skf/3yOjkUo66dfbhBQ4+F4ng49b16MzEZznSFcDoszqrkkgDgAGNBsdPiRwPWATbO2o+wQYY9q1G1fZ7aBld6KsjGMM9XFzCX/WfoxKtRiV1qgZ2QptN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776977682; c=relaxed/simple;
	bh=siK3DbSjtbdXIzp+rb57NbLxo/EWi9u81nppU4wsdus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkmUQIv6jxEI4sKFTOTWhHsFuvWQ0sHBcgtYRT2JRnjnFfefdzCWPCDS2sP9DSdKDyHi9ng2oJK6uE0WoummPqy4apFT/5EDKapsM2NPjfasxKy2+T2OQ2dSDIQFmDApBLg0AOprvAQZXiZenzGEbXxU5tXKkm1a27QDNZRzydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tf/sFF42; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tf/sFF42"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-470145d7df5so4423311b6e.0
        for <imx@lists.linux.dev>; Thu, 23 Apr 2026 13:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776977678; x=1777582478; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJr2/Y7a9Z56nZcPhFHsPKIdw2ZGjJ+UXlDP2b9GwxI=;
        b=Tf/sFF42jwsNZ9FbuLvid3Y7wETgCq/dfDNbysyDHqd3mdXHr8rRTfvaG3fnNsGWXa
         aSsqwdtklQl+SB3WyMlLkHPKZG9wC8Lton2DytMuu/z7iR8UGx/bBeYEl4VcgkREw1wY
         SzmXxb+lHW0iiFzJIzHJpm94AIWXtnDrlmCJIpXNkjypr3Jg/G1jqZv4YRmImEq1kiZn
         fvBfMEGXUiKezYTGPiPqKg9F++cHNx2C4qMTs/lXO5JZ4kD43rCDKnuEKSIV+Rk7SNwv
         gXqoVvO/JM4Al4M6oo3Xi4ALI4zvd+odXt61EMxV0GKFYyeE59TvlFoT4rDPZ7PArXuw
         9HYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776977678; x=1777582478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mJr2/Y7a9Z56nZcPhFHsPKIdw2ZGjJ+UXlDP2b9GwxI=;
        b=S+DhogfN/j1Z2Nq2em5yBVCGiTKFMLRHVkkTvN4em2k2RslfTZ1jPhhaFQv983c4Xl
         qsjYaamALTDEzq2YK56y+HQFP36MlWOvEqsqz8p7dIAUK+zoUITf49Pszd97us72xEjW
         V7rjnZp5K19ytJy/cIrSMya7d4LAQ2ZaOc3x3YYpOtUU90wDrAtr1VCeDBUm8yLW9tgo
         n+OqDKcXCGM8GcGDVMf4n1thI5+3SAe8f8FHCxlJCGsEg8fKIPMf++/yUGs+cJEgna2P
         m8D1NMHUxKp+wnMzU4qU/Dw2PnYXGnBxKyaDbMb7WOqLQQ/MV089bMGcqVVnPANM49t9
         wEwA==
X-Forwarded-Encrypted: i=1; AFNElJ9YCaCQwvbb9Kj2B58g4x1nkfgYu7mpz0eFMnHTi+M02TBNe2rjR4/2OXhrDzYtLAlm4DE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIMm8dtVa2CpQDT1e6EPtNw50oFx45sPWL7SMYSiwQj03yOqZZ
	2E7ezQnlagCYB2LsWQdmhaRj3kDYiAQwgw546hM+tq5xGljCTdnas1Bo
X-Gm-Gg: AeBDieuTOKCOpLpaupDWrD6SrltyuN1IfBG0E6eLGniiQB7V/8DJWN6+AYRf+leGFkA
	QqNPzTA8jvnbaJE5IOnDDNyVu46SINIES/bLBda00OKF5fktMxD1Nwyr+2k2AI1QARiFjz6ONhh
	ypQPcC5HtXqDywfn3qJCsyqX/RJflpkhNvm3dQc55PIMygfGG9X5wzJtnxMgwxeSbM4vtuCOqZ9
	3Yi9iu902ecAcCcXPuMpv5JdC8xui8FaVjnLwAvkytXOTmje5YXXREIWNaYmqRI5i9ZzEKtVQtE
	IxC3kljCaq43Dotpg2vI+kEftnVATjts58osYjEzgLVXHuueuhB8w8bANA6+Wt9k8jP1KMZrOVS
	MHiMoBV3j3JG6Bg8gWbJpIXCofDDFd/xe5jHgbdxENYU8GY62/vUwBHy5XSatYtS7MChnAtdVFg
	6+ncF5VAjsKSZRovPomYMNOsv4IDSnoiXB62h03BCA+3v73AZqCE2zbQ1P8XyuaK1tS5m74oYt
X-Received: by 2002:a05:6808:d51:b0:466:f60b:19d7 with SMTP id 5614622812f47-4799c8febffmr15113908b6e.1.1776977677733;
        Thu, 23 Apr 2026 13:54:37 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4799fead505sm14329744b6e.2.2026.04.23.13.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 13:54:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Thu, 23 Apr 2026 14:53:48 -0600
Subject: [PATCH v14 07/92] docs/dyndbg: update examples \012 to \n
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-submit-dyndbg-classmap-foundation-v14-7-2b809a8019d0@gmail.com>
References: <20260423-submit-dyndbg-classmap-foundation-v14-0-2b809a8019d0@gmail.com>
In-Reply-To: <20260423-submit-dyndbg-classmap-foundation-v14-0-2b809a8019d0@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Jason Baron <jbaron@akamai.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, Sean Paul <sean@poorly.run>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Ruben Wauters <rubenru09@aol.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Liu Ying <victor.liu@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Paul Kocialkowski <paulk@sys-base.io>, 
 Jianmin Lv <lvjianmin@loongson.cn>, Qianhai Wu <wuqianhai@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>, Mingcong Bai <jeffbai@aosc.io>, 
 Xi Ruoyao <xry111@xry111.site>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776977636; l=2677;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=siK3DbSjtbdXIzp+rb57NbLxo/EWi9u81nppU4wsdus=;
 b=ePiF0EDWwi/oQY3TXS9i+qRl3hbaq3feRkC0e2PDbzK0sheeYllu5PZJlb5eUbhbmthqySsq4
 IoWvb2TDFhCDz/i/TjB+nfqMjI3xELvbI8eTQStIQFj10HRY4dVJV1a
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 095a63892257..4b14d9fd0300 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =_ "    %s\012"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =_ "    %s\012"
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 

-- 
2.53.0

