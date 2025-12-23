Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E094287254
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 11:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766490112; cv=none; b=uJCLaNiEZALlLq9qaSSlaBbOzlc9vsMIzr3iOwLy+hpv3rGwPYnQY4nSgXa3/sqGxI3cHHWafGKZ2U4X9oa6XfJUNRYuA832nQhgkabjG1eDbHUGVqNwhIIVW/lxXZdhHJ8BVXLoMUWVg4p8M0A9uLJjaw2lDi9xVt1qT8dFvCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766490112; c=relaxed/simple;
	bh=7ZK0bTfGxrRAgf5VD4ybvgyLxH2fzuAcw+Dy5S3bJ1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tb+Pl81KE8rEwBo7z2JIw/9lnjEy/5luFd0oiy2Gd0WExyB0OMgDAjVQYZ9RoLtjTnU97VneXpUDmDM+RxipwFrbyD5Pui6aZyBlfnosyOFDLwan4mL9kkc2p/6J9pU7TP4aFG1TghNLm5FFVpnFiYSxySGJ4e+huPFLgeMGza4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h1rQc7Pp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h1rQc7Pp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766490109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6sLHyZjdhjDBt6Tlyx92GjgIeB1OFSYRftB7W+PXVHI=;
	b=h1rQc7Pplv9q5iItizuIk6J+84wY2O997HU4JYrlk8B9zAlYneXcMFqFaYxytGUY/ABEn7
	mIH2jDM4AwTP5qqSYo/A671D+kLV5wKuCxbIjJe0YKlcOm2tlrj9N04ogtRWKKeI7MDHTX
	0o8hdHPrwpDxmN4lbV25LIEJCtFWoVA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-txe7w5Z8MrC-XjX5Xe1d1g-1; Tue, 23 Dec 2025 06:41:47 -0500
X-MC-Unique: txe7w5Z8MrC-XjX5Xe1d1g-1
X-Mimecast-MFC-AGG-ID: txe7w5Z8MrC-XjX5Xe1d1g_1766490107
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-430fe16b481so2499455f8f.3
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 03:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766490106; x=1767094906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sLHyZjdhjDBt6Tlyx92GjgIeB1OFSYRftB7W+PXVHI=;
        b=jgfsmPjVy5UcY2qMVSfDNHPP6fbfXHlgr/GXRd4LplNLJypSWZBiVFLeLq9AMecsC4
         3+GSiJ0JkJBtiswBvsmjtXhh/aDDL5H10vDsZXubDMxZpcBc9ZX6+d6gQIRJtyMzpw66
         t+jEZT7X5e3uBASkFtz2ZFZdx//asVcpbWOu6LC7si3WBoofpO2rHEiSMC/7kgsFnLoB
         DxlAmJADe9dZlQpQi/xnwyvbyOzhmBjZIg30bF8PVk4JXWWsaVZXZlt4V2WeHj6tGL/X
         VidrmFLLUfy1GACHFkxwCwZ/cwzc21l/jWde+uV1oHEEVaT+9WrEvPM7Cm7HowXCqbb9
         ZiVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvY/cP1VVuE5V1P80hHEKktTnVJiCe72Vc95STyf09Tuu+1MlP2Q0gUyAFJL1Q3LFDZaM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQABnzbrIIgd3Zovi80Qlg/YbWTp1U6MPbxK7XrrKuZixX8dBr
	IJcbqEwwfWlrL1VMgiQO7XQYauNnOPT5LRTcvKPxitBHVYwIL/kr0dvQzvS/hXInxBNw51w00gP
	RZFTFrNaels/KeLuwxCRSUmYB4pXl4Zrn57pVICGF/g11jHKlQkIOOg==
X-Gm-Gg: AY/fxX6MqRwa/2ulAjRJVNQku8DgNMzGRoZInHJgsaGEcchLG2MSlibzLw8vaBnSDtS
	6pedsII8Z1Zw39FKnwDhNQpX4wAeOzkzmOfIbmFg4M/EE3DvbDP2FjW0GClVfZBmXsFLqaxVcUZ
	9NNMWkBLhkPKSmdI0xJNdPUFjJEHln5pyqHytU+Uvs57pvNvuNIrc0IH+ufAQOpaXlOpUPSEBc/
	Jtnpp+XDVU9doCyqI6AnNVqVqBcaGR0glplC/le+3wsrOhxOxbpdTJf4pyNHasLkDGGydelpIja
	Wp429//HDhE2tRtQUf7b6me3ZqkDKDcRJFOxPqL2zMJVPwpJ6l8b5g4XFQ2VEuHcAWQRyA1bBKr
	9vFhgf1Rc0P4D
X-Received: by 2002:a05:6000:2886:b0:42b:4247:b077 with SMTP id ffacd0b85a97d-4324e501629mr16143503f8f.41.1766490106481;
        Tue, 23 Dec 2025 03:41:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPhaXEvdC/d9UBYntc4O15i4YttaJ4C4olbdEgTOb9sXo4XaU7wPfNoTNX8sKpU6s3I2QtjQ==
X-Received: by 2002:a05:6000:2886:b0:42b:4247:b077 with SMTP id ffacd0b85a97d-4324e501629mr16143448f8f.41.1766490105967;
        Tue, 23 Dec 2025 03:41:45 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227casm27605658f8f.15.2025.12.23.03.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 03:41:45 -0800 (PST)
Message-ID: <51c7048a-52dc-47e1-97c3-2aa0d6555643@redhat.com>
Date: Tue, 23 Dec 2025 12:41:41 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Zhi Li <lizhi2@eswincomputing.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
 Samin Guo <samin.guo@starfivetech.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rjdDBuf5MICLbO12lP4wFT3glO1X2SU5VhwJl5wpyPA_1766490107
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/19/25 12:42 PM, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> The DTS changes will go in separately.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Quite unusual SoB chain... I think it would be better if you could stick
to one or the other; also the subj prefix should include the target tree
(net-next in this case); finally...

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.

