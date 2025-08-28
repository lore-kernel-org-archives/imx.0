Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF2327E7FB
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396850; cv=none; b=KWsWlTRdctlGEazJVYWdN75mu07hDOi2Jvtx11Tw4X+IEcVhFZwV/Gi/N/HH4GkDhKwnfva6TTV2aBUZ9RDxzjPy5QJhcJr/2BCeQo/WoTILmkApQore2yW6V0tu/1x3er1l+aS06wGbmc/CefQARyLa2BC8cCrlmwV1uiS+h7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396850; c=relaxed/simple;
	bh=RFujl0Cr/YaORxwURfe0zTKDzCwOsKiOevFTrddSrvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukbqFLwPh8/l/VQybm7gdI0GDW9NZqUSDEj3ygn7NUatNRHIdaJPNP38w8LZOq3fVgDFVGsWJO+wugM30RRNZ6Y1QMvZy6v/cAwfHFWiQTCNneyfvvTnY9YnUCbDvHsNNFPmyqJ715Bs0q4r7OjXWkTF894UJq+AVdxtKEaJmBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sG/Pb1EQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sG/Pb1EQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b627ea685so9069905e9.1
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396845; x=1757001645; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=sG/Pb1EQdA85uNfXTM3fW7txgKZYDplc7nCNzDGZVJWV8KQm7Dbl6hmJJpARgl0GBs
         6hxRGDUuQme8WEcJZbPCd0bXFWdHfTlyvAcPb4Pj07S7CZZZnw41ueWrZQjnpDaAYcGN
         093MziMggVugnA7uvvQ+PGeu8gM7ykDuBnzRF4fkeQelXPvDhB+S2bcpnyCN2i2kLA5V
         ugSRYkhWZEpGl9sozmZrH7JtPB9nY9um8411niglv/Unu4qWwS8UEKQHT4iNwWO8Iw3x
         e2dHbrVSckhV9r+ibT6Kd2a5k0S0u4/cVEVRbSu9P5VF2cjvLABxwq+ul3tByFUaa17I
         dMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396845; x=1757001645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=hh3sTOb7UQvaLLxbpXGaGjvW39MBlw9mPMN4KLdc/UzH0rR4pUfYf2yzsktUQPLuWx
         u+O6M6xS2JpVcbtx+H0eQ64e07LO1YLlMQNz2UBseaS1jmp7BmBxnAjPLhpO5zsSWNI2
         udJlTusiDu7gL+ShoW1TKXWm/xDapXLGKpd9NsVJHlJpDaz4SEIGoncbs/q+XEFMUwjS
         4L2cAkPQtfuNn7LYnLoS/tk5vjtM2y3z8emro3oWdsAnwz6tOp5XDwKMpP+UmAXD48ih
         C+m34b3UmY3xnw0KSuP/Z6gVVzV4toVjSxmwoUboOZ5c5vB9bt/51rGB9TtXj6HG0Mls
         jpzw==
X-Forwarded-Encrypted: i=1; AJvYcCXo6yvlpXw6mUPaoSbBzuhK/+K9GjqbSwQQfQimOEy8MYlO8I5W5yAm3c9eatFEBxabklE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSkBOobvlrbo8Ctuh9MsfBlMkttAlcLiNXOQpSbDhPaj//zT7G
	ecuTsfVOvFwoBSU4FNymndv+c7TdkEbhzytKsXLPWtDOB60zChJfadgdTJ9wuWJLTsU=
X-Gm-Gg: ASbGnctfxsvG3lPbwc5WR5a+JNEI20nBF/50P6cfqYT3YpFN/yV2yoh75rOWemcJWs5
	8i2SNSrt4iwqFMU7AEkPBuNvRFe6aWyrDymVJvnQ24qHbXUKoqQ3QacGIiJh+EXDsBMpkLtsW2s
	JrfjH736FjiIBxIBWt273xzlonQ7lamPtP7kRNp5pdiyUWZj7qnRq0ZkuDijGfDU2b3jTGodema
	EJTDvYS1qilomgMxZaoNy0frZ4ytgCXF75Dbs5P2+Y75zZSDzV9H8fJbSfLmHc45NyGNcM71WBA
	fWVCNC8D5Vm78z3SVA74YmUSWUq44YfEYbPOdJb+yT9vAzj4epQAonpSUlXnc1nULCqWb/GnWQa
	g3Dh5NgVfMsw2jhTrAg==
X-Google-Smtp-Source: AGHT+IH9eqAsu0mBkmZO1sLp4iQB82doTTOSGeYtxhUeFPIbPn5xY/WnY8KAWmQi9Jdt7MPymPYo1A==
X-Received: by 2002:a05:600c:4f05:b0:45b:5f5e:f1e4 with SMTP id 5b1f17b1804b1-45b648111dfmr100878215e9.27.1756396845191;
        Thu, 28 Aug 2025 09:00:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:23 +0200
Subject: [PATCH v6 15/15] pinctrl: qcom: make the pinmuxing strict
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-15-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M6AAfE1ZYIqFZsBoDZ4O1bJllvK/6bMXFJ6Zryc+i/E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0PX+ObgCFGCgqoUrUjW902keUOxgLE8EUsB
 XcES2lA2qmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DwAKCRARpy6gFHHX
 ctL5D/9vpjY2JraOKI6xQLDzt9TXljIFuNDozQLvzOHyC9MgvKOWbsLqyOrunHPfrNqqKOFBK3T
 KwmfdS1uCAhkPVJFu9+QIjoLLd5p693JFSuHkObJvgCet04MNbRQLB5JHqL6iuH+bu9MyubXgwJ
 krZwBmRMnrDWPenruj6k4hAA2ihAQlUx9GOdKpiLfvYH8b6RAkHtDQPWjO21WqCLg4XFku4EESO
 5IruyaJkV3MTpbYIobh2C/a6mUW8SqezSSh1LG4Bd1XobET0b8+hWmght65TmOvonC+GLe5r2Wh
 pLFBhM0QRVLHeqtJgYx4uIqUU9M0k9AXIOR9238ttf3Ct3ldZ9ZfTONb3jNBXOp9939T7h4ZLpx
 SUaPlc2TzAFEbRUJNonPEbxaaa0+qbqTjF9ltT5tZC1Mlqr8pyzA1YH8BN9wyrbK4N6qH1ty3MJ
 6emE/yXMZFLsGd8hOSA+egnDYIO5BK1s91hpGWU/ZY/fadrMn6UtPYHf85JlfFzmhIlsS9nHjfY
 oLMcdYawGwDD/MdG1Dt9y2yWY+0T4iNxJoUqYKmpisWrARyHw/iR5VjqJFS50k88+CJMB1H36z0
 letY3JTa4NNIETPLbq0dvyWaZmnqCNmCzEgKPyWyC7sxmk66PTtyQoJj32nMAH62uZVZ+A6DZeE
 zit65McHjdrqSGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a5f69464827119dfe2a7781b558094b283fca215..1751d838ce95d6138c824b90098f74891dec7656 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1

