Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F7F221D8E
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605981; cv=none; b=eTUBH9smAzLmXFQWKzPHue+Tz2T2wXR78Xxejx5IcQrtEASareqmSHFbWWsnHaJe/WbNirWTr1nWaaCuOTohzOLeqL5uDejsGQup18d4cwJYLeGj6wF8azpDeSobPlleN5iK6GRbjM+OuF3V48ODSaMBsI3xWp5W87MnnEaKjbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605981; c=relaxed/simple;
	bh=hTTzwFkMModi7DHDk8KLH+uFsTnqarhMYEFPjHVKC2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=krPCejXhimHINWSeDYRD0bYQIPRHQhGoLUixFzf1/qkDQus3KWywDeEerhGWg0796EX88zgAHkEHa5UHX8bvTY89Hq9J5DdMlrk7FN4giv5HkA42EdJiKXibhgtOv9vRh0Dtf9HoBLTWZctxbdW0z1zXGQ7NBV3UnfcXRKf+Vf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TfNjNb9Q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TfNjNb9Q"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4363ae65100so6768605e9.0
        for <imx@lists.linux.dev>; Thu, 19 Dec 2024 02:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734605978; x=1735210778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cS+nRbp5xUtPRCpEi25EwuCO4ItLuZHhxv5YcNc6e4M=;
        b=TfNjNb9Q8K+HCFuasuMGMgNZ5x6c5FbcFAt5r620l1IAGbUZgLD8HuFq289SHe50Ux
         rGvF1w1Wse/arAdKbtxYORzBmFbuFrUIu6Q76bGKaNz5EIREg2W2ziH3XOkHxMeXm9Tv
         flMPAJlecHY45GK0c5rVThRk8UhyYv86x4Mu6+5Z8FzMMzlPFgSCSN4WLbJ+XnijE9lj
         3NwlRapW+fwKhSNx7Yh5G0A76lFrucjIRis+d9skrJLewfIuS7AP8DALHH0vTcx9LboP
         nw4q8Aqr8OrEbhJlO50jMKvjwjxcq+cegpj2S3JyKCjhD06zQjrWwGToji11fZleTgEy
         M/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734605978; x=1735210778;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cS+nRbp5xUtPRCpEi25EwuCO4ItLuZHhxv5YcNc6e4M=;
        b=kaDcSJlRAPc8T154c7WuwdNHwbqHe0Xl2KyZlZYdvGwdK1+g2P4hg6lkecJQECb4pr
         CKa/y/qzi0f4Qg6ywo5LLQcOPLmKniDFANyxpanRwqGCp1HaGiP+E4RLEqEWgz2tT3aA
         QNaZo2CNs5rF7QOBY7t4//7rn617gVmkZPDRzg7ZXB5ZZeJ2meyTHnlLrWh2H8W3vdrz
         QIHuT5TKPlRr0e5o9uLp+goJfvKbt8PquUIXRNZYGi3iDG4Lmi3N5Zf+hgwS+E+0wrAQ
         Mc7fuLFJMD92wnP2utu93WJyCUNriyPBhvbsRz3WlbX+SnatWV/Js0TX2a8nuO5t9miu
         7RmA==
X-Forwarded-Encrypted: i=1; AJvYcCUUsOwG/GPvZIgXtTFBGCEY6dIz8eKyhA/HkfM6VK2KMABGIxFRHlR7u6TBn+6HXrjD8Wc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFzvxVM2W5tayemBCvXJT2vsTjXMmIdx5pnTsOUZjMCHNZ5UAf
	AOuHHmAan9gDHFKdtMLIafIKwQRcdbDWb1mKRPl7LxI4obAn66WHyMue6ARQrSM=
X-Gm-Gg: ASbGncumWSLzXwRuUOuYOtx2YWf8YGoF9QM0cXRslvES9Vv4lvze+qJEFgUhEulajVH
	VlUNNbvqoYYwm83dseUJCTV/DXM/tJsM3EWoEkUy3TzfFecp3xv/Bsg3OEmuszWLSajYwCsIhWO
	56TBykg2P3TXvvjvFDNxQUoDp4Hm7357U6iWzDHramRmVqr73X484Xpe6s6r7r4Zu1vJOpdN1o6
	tscu5th8Z++mAnR9ldR7Q+XAazreevEUNWq20a24avrRe2Mx1Ou80FtZzHdduj5dwntpdWNJkXq
	Yw==
X-Google-Smtp-Source: AGHT+IENRpTZ1e7nnnS7IIxmPArBgJVUoa1AtaNNn0RO62JEfVFRRCR0Cb6o8qC4D0b/oXcnJqyscw==
X-Received: by 2002:a5d:584e:0:b0:385:e9de:d521 with SMTP id ffacd0b85a97d-38a19af880cmr2997296f8f.8.1734605977659;
        Thu, 19 Dec 2024 02:59:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2d2sm1289920f8f.71.2024.12.19.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 02:59:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: andrzej.hajda@intel.com, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, marex@denx.de, Andrej Picej <andrej.picej@norik.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
In-Reply-To: <20241216085410.1968634-1-andrej.picej@norik.com>
References: <20241216085410.1968634-1-andrej.picej@norik.com>
Subject: Re: (subset) [PATCH v7 0/3] SN65DSI83/4 lvds_vod_swing properties
Message-Id: <173460597657.883073.14115671156294694663.b4-ty@linaro.org>
Date: Thu, 19 Dec 2024 11:59:36 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Mon, 16 Dec 2024 09:54:07 +0100, Andrej Picej wrote:
> The LVDS differential voltage swing can be specified as arrays of min, max
> in microvolts. Two arrays, one for data-lanes and one for clock-lane can
> be specified. Additionally, because LVDS voltage swing depends on near-end
> termination this can now also be specified with separate property.
> 
> Driver goes through the tables, taken from datasheet [1] and selects the
> appropriate configuration. If appropriate configuration can not be found
> the probe fails. If these properties are not defined default values are
> used as before.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add properties for ti,lvds-vod-swing
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/63f4e7dfef8c1162e22cd25c9a23b125ba40dfc4
[2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing optional properties
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d2b8c6d5495706eee2347483ea89b5c13f256ff2

-- 
Neil

