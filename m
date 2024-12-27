Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DF11F2360
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735303620; cv=none; b=sr2nGXvU9SobCqtbIhcEK/Mjr4SXp5WDDFlPDQI+m1V7VXoxKP9hB8SOUtyjeVk50PD6gHbPnqaeIIbeUUyenaBGeRdaHwTl1lQyVnBImyNTzg3HegZerb9JwfwZjtnXVqDhbK/LC3JQfMUYoB7tGqMq3gY4ltT0qjOV6CBg5IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735303620; c=relaxed/simple;
	bh=Nq96OkZh3I2dZ1KGPOiRpqceVPg6Y6dtZ8YbuLUGboM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uafvdzf5kGmalDm+xRXkVB18fWQoSpUHOpoUnzjl8PPa9T8BHhjrqoBfdzGikB6Ktcg05iu2Alg/TmeLremKLpZhX3CswvuhuHqtwdH7XA0vy5Hv24u7zRpSrMqNuqohDiCW5cIdD7R/asoRTsK4s+o1HxS21XqJWOY4gaTVV/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GiIiPf+P; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GiIiPf+P"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso43606705e9.1
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 04:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735303617; x=1735908417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UN1PfYXNv5GA5EWcDyG0SuUKxMnngW7vBJ/To7wqj0=;
        b=GiIiPf+PiCqqsXn/oEcn+4yt9/LiQbUFq+z1oM12msOtAx4disO04l+gycV+wwD5zf
         cmxu2zyzQqk+Wdkx3TKnF3RdusCJWEk2XRwzKgWJxKm9i7ek9108P7ZB1E4N52sshIv/
         oFmvJpSveWGjBkXtffOXMhtyr50F2GDEj/1dyODBxF3yEKxVPmgb4eDRr/bmqOnmRQOu
         sv7Y6qn6CVasfU9TZ0cpZt5rzhTyMXYxiw1msGOeNI+amg5mJ6Xj69Ny0XthOiH7zv4N
         HLAZvm9BUDesuXN/2bFq9mPAUES7On1oqY5aqYYBIr3ibMxxmTxvptajUh/I+lwVH71s
         jzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303617; x=1735908417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UN1PfYXNv5GA5EWcDyG0SuUKxMnngW7vBJ/To7wqj0=;
        b=QgwkB9zfXeMGPwfdF1cWMbqR8EdHaMaZ6doJJmdktBL7YQOeLMMx/HfC9TjGK1OmOA
         OcsxBg0DeoWXNiOrnky2vPIPMijYAAxEmX1GDugZhX5tHF/hlDhNXrkCLLPQd8pn4sRQ
         JVdWoga/A7owko2zoYEBQAqWIjfa6/6a2140nBf1X51h2GHAVr4h81dASl9TAh0SQTny
         5ew7bkUPxV+GX3WAbNB1v5lwj4TehpB3X9pYCALrLkIgNL8gAvlY9o3i6YUoHUGAwkNQ
         Hjj5+GeDK2Aib9lZFAm74GVLdk7pHDbhD456OoqoEqQE0k+20h7r1gooee3JjQepWrpw
         QuoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIt5g0O7mtM+GE1Kxw9ZLQBFzsBjttxDH9EXGkQtvtg5fOF2h6jB3TDsJ4yr6eVg6cXx0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyS+2/iG3uCEkwV6ny+45FZlqNK3ax/Exvt4alo9bXaJjKJMI88
	AFiprB1n0NbxEyL1/w6Ue+G61E/EzlmJmtJ29caBuT/Wb5pksUVNDD5UAnLkGW4=
X-Gm-Gg: ASbGncu/9K0XQe93o+BG1cezRH3q6A/kIKouScFoRuSA21Sz5RzchSGvavSDlzoh16f
	D4GkcH+u4HQ3TnWCC9ppcsj9JZHFKY1A5+/tFVO81oEdYnnQpBUitsy2AgqSECEPSPIrp+gXFVo
	+StsCCCF/pElVtxBZpbRLVJ8xxkDjLyKU0LFCGFrsvv1I+cVBB57oDcBEhVbA+d5/vZbHtFt4Xv
	gl/Iw6/u/6fwAnkSDdVDcJu4OlShTYkE5XGj5WUj0O7wN9Iznd1pFvY
X-Google-Smtp-Source: AGHT+IGUz2NO9FEIpAO3AKn3yA2N+FizKlvW523dxOyulaD8vq0KUtWqJu6Qzescg3PJZW/KKP45Nw==
X-Received: by 2002:a05:600c:585a:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-4365c770795mr216692485e9.4.1735303617020;
        Fri, 27 Dec 2024 04:46:57 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm297172905e9.19.2024.12.27.04.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:46:56 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	shengjiu.wang@gmail.com,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] clk: imx93: Add IMX93_CLK_SPDIF_IPG clock
Date: Fri, 27 Dec 2024 14:46:02 +0200
Message-Id: <173530350112.4140483.13164625485950770989.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
References: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 19 Nov 2024 09:58:02 +0800, Shengjiu Wang wrote:
> The IMX93_CLK_SPDIF_GATE also controls the gate of IPG clock
> and root clock, need to define them separately.
> Otherwise driver disable IMX93_CLK_SPDIF_GATE will cause
> IPG clock is also disabled, then register accessing fail.
> 
> changes in v3:
> - add fixes tag for all 3 commits
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: imx93: Add SPDIF IPG clk
      commit: 32e9dea2645fa10dfa08b4e333918affaf1e4de5
[2/3] clk: imx93: Add IMX93_CLK_SPDIF_IPG clock
      commit: 6a7853544482e2336b5b8bb9a4b964f9d687f290
[3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as SPDIF IPG clock
      commit: 570b890e66334f283710af36feb2115f16c7a27c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
