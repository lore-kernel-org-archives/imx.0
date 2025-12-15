Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923703090C4
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765809722; cv=none; b=njY2K1nu3OPnesGHDOnMPXciIfHR07TaicJTIehLPI3/ymdjwOaHiAn+svaSoCIPXGcWtU8L0w8nq6Z7NCIs4UtquWscX0tgt8n93YltPWegsZYY8iu0RRGRqYAkGiAyBoBJRNEGvzpXysLN8lkHv6NAhgRVAWVsxbCB3I1AlmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765809722; c=relaxed/simple;
	bh=NCidwRDzH4/FkaOzAo5G9lk+9pbGbuUPUjPh0uUo2aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ogh7XCjfh2I52jIa+/cFVsBWL3ocoLG8GGsg2B3HkNODqGyvxWtNtmttVVv2rBdFnnNmTv8Lxtn+Ed3V/fRjcY+1By90F+A3/cZswpMeAFfDGKdPCX3um+65p9Niz31FTe5lGo5THZ1nbP/pD3jRBsXxjMQhLPyAu5bDtWaVfz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7w6vcwV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7w6vcwV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso28538465e9.3
        for <imx@lists.linux.dev>; Mon, 15 Dec 2025 06:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765809717; x=1766414517; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7THcIS9oCYAXpQsDheP6Q1AjyyUSRDifHsm4jcW8OQo=;
        b=c7w6vcwVjMWAXcVxdX8QXP7S0TsUckzsO9LAzjGhHISBEGEzgKpq2fLTUW1keXEQ2h
         9nLYdXBjx5Bd8baJOL8v2F/wPX7tljNmbzA4oWx7xmB1qaM5SANwgSlnfGzJeuk4twnw
         0Aoh8+bZVoch0dTAeaRDhpFzj5mjKcMnp4t0nM6t9GXUJTAZ19NJrkoxQcLDfDbMulph
         jci6cKKs394LQD6Q+i9K566bJWnva/xCowvuRXl7mVIqYuwJOxbRhWO5JOZRB+kiW8IN
         W2jrVAVyACcaTmmoVPUn19GpnuEwN103UvbeP2jnUpRQq2HExC04lFzmLEnYw7yOT1hY
         iDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765809717; x=1766414517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7THcIS9oCYAXpQsDheP6Q1AjyyUSRDifHsm4jcW8OQo=;
        b=HRcfNxxdvl/kP2qQzT6ZHEZC7+INHmU/51+gTW6RQ+upK9U9AdgupEC265mKb25GQ+
         6KFXJt8MQx8ZVl+Icg/0YajCtZ/lP1jrS0R+xO7X6KZWBCuGbGvBnjErxZtyMIYPFNW9
         ZpqcruYoqA2i7KtdR365+bkN3veZKH5/5M4ESWz8VVEM40eSbSz8Ljs1JeKT0HSOVQel
         gjD6vILwa539IQJDIC7ThSJVB2+NFMn8BwZ4uvd+FKb90wIsTmq9b+lAhycjajLx8ozo
         y9LMpRXfgrIOduxtYhN29414xFsW13Sc/dwmeQEzRoCZEtpZ3WYXRERW/zmW3XxEe+U+
         6Lqw==
X-Forwarded-Encrypted: i=1; AJvYcCURAiqcErn1sjhb+RKdhX0KVlRQOvbn+OQ0AEWJX0e7VYQbXAQ/qq6NNdGO73/nh9Uz2BY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLBY2EgiK4HuEtK9VdPq6zo8DHOUtOvR/pzs4DzJ4dv7n2Gs3J
	TxGGnrSYhojh5utsaZwAJoRe0Ln8AOAgllErAHi7e4OkGzO9g37PSkTfh878kXSd1IM=
X-Gm-Gg: AY/fxX6mxgFsCU0yWClPlw21JVZCWelM67isW3Z3uAy0730zNHKO9BLOkkD2iZmPvcc
	5GVBL+Lq6utXdWoww4lX0xIAMxICVdjvpgDgSESWjzBZyX4H49JTBULFISExeN2FeGnTEUx21bO
	ZRinatrB58HJ5R68xhu3JbRdBRP5HMI0nJjLx5Axm5TLocgfVWai+M8uZdekqbdXyMlR8dLidZg
	DrNiSsR8jTk6Vmh0AcMQOsUE98rGLGY+42Os8iEuemznvU0MpK6NVapQ6j7RgbA94vTJoQ2MyKY
	ZLnkxB1oquiBVYs6z03hCXYay2vI/Ktc+3Cj6c8MaXJUIwFqqpe+qT4leiK1MAkrLl4XhoTpqyY
	/1c+nHmpOMR1pprIriPaYtMB1+J52SQVT2ALgU0EDVg0GG8KQ7BD7Y+s6S07cwY6kviB1rWxx6M
	wdeOyR0To1LLE95sfD
X-Google-Smtp-Source: AGHT+IFqe4pSchC0t29NdS8Io0U0AaSg1nRBgtIB9Y/g3CNv9tZepOBjVbBftWbLoImGJYQ+serrww==
X-Received: by 2002:a05:600c:4e0e:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-47a8f915c3fmr122994625e9.35.1765809716476;
        Mon, 15 Dec 2025 06:41:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8f3894sm195798645e9.15.2025.12.15.06.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:41:56 -0800 (PST)
Date: Mon, 15 Dec 2025 17:41:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linaro-s32@linaro.org, NXP S32 Linux Team <s32@nxp.com>
Subject: [PATCH v2 2/4] dt-bindings: mfd: syscon: Document the GPR syscon for
 the NXP S32 SoCs
Message-ID: <792d3f59b9f519529b94e673faf70d77c4b61fb3.1765806521.git.dan.carpenter@linaro.org>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1765806521.git.dan.carpenter@linaro.org>

The NXP S32 SoCs have a GPR region which is used by a variety of
drivers.  Some examples of the registers in this region are:

  * DDR_PMU_IRQ
  * GMAC0_PHY_INTF_SEL
  * GMAC1_PHY_INTF_SEL
  * PFE_EMACS_INTF_SEL
  * PFE_COH_EN
  * PFE_PWR_CTRL
  * PFE_EMACS_GENCTRL1
  * PFE_GENCTRL3

Use the syscon interface to access these registers.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Use nxp,s32g2-gpr and nxp,s32g3-gpr instead of nxp,s32g-gpr

 Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 55efb83b1495..694733aeb270 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -102,6 +102,8 @@ select:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - nxp,s32g2-gpr
+          - nxp,s32g3-gpr
           - qcom,apq8064-mmss-sfpb
           - qcom,apq8064-sps-sic
           - rockchip,px30-qos
@@ -212,6 +214,8 @@ properties:
               - mstar,msc313-pmsleep
               - nuvoton,ma35d1-sys
               - nuvoton,wpcm450-shm
+              - nxp,s32g2-gpr
+              - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
               - rockchip,px30-qos
-- 
2.51.0

