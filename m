Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8574935E1DB
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251290; cv=none; b=T24cAtKVUU7U1d7Yi99wejUaFG9jV3MfBTBcNVc3bqSxYbFUWY1e1jzbevNgZNZsnYiHrbsm97biDwH/XmZSkHZ2J0QMoSh3qPRenoddDk6a4NzpCC22lvCN2M/4py8lRCuQWA5XniPkp7lb9967ZoEsRslKOEwsectlyKoT76U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251290; c=relaxed/simple;
	bh=SQEbNHWiJIM6sDDgeR5ssNziH59tYfVqTFW3jiKDt3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cMz/Pk/TJDz5sNwDzK4CEQ88X4c409RVNkF7zzqwHBzZe6Pb1x6wIXkfSEbzj0KlJ4HrYIEmtQVxaeh8QbcblPxGSWtNw84HBWf6iydAWulgWJXll2DisQHsG1xNsXLihotCIF3YjX2Uy9Zne/l4wfY62jhYq21BguLYigPWuYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YBeURBQt; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YBeURBQt"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3968b1e521fso717011fa.1
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 01:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251287; x=1781856087; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGSXIXNGhXGoEinX4j2POzhiX7uHLTUs+2fOXh7YSMY=;
        b=YBeURBQtA93gi8PFj8XCoahMzfmPunYfxi+P/M4wzVGFrATh2+w0cj+MntUW4tG/YY
         mbMuNApz9h7a1qBumC0Gh0ZtmquMusrxESjq681sZR7OQBoK6RqeYV/JfQ9ie1MSIEJe
         CrgyfgfDJHTZCCEavU37VFq0aHxpJxsvR4oprnbmEw4Rl6XmAJN4nvxSQ/Tn0C1q9HKW
         e8+Ci62Pw8Lt9RNYLxwEaryAXjwCN+/h0VyFzCr1BDyQlzMkwg3TxfuM0rDxMafJUsVU
         BVbXrGPnGQGbt07KcpTlzZZie/aRTItPjYtApy/QYqUcwoRn/4xN8RniX3tX2l6o+/5+
         pf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251287; x=1781856087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGSXIXNGhXGoEinX4j2POzhiX7uHLTUs+2fOXh7YSMY=;
        b=LPSxI3KyzRLHakpzTOti7uaKPr6KLz8nRfuPTC4BU2njhzLo/yJvYXGjOzTO7qRrle
         b6n5sy6HEu5UWKlpQdNbnOykpxardlX5ZF8aoDgsYq1+cWIODXMQTES1xexpjbna6Te1
         zyfWInQhLtHNX8QCnBWLZxjL9MwevBGP4RwlCQaK3H0QNDuWhErQnvNz+JEHe2/x2940
         ScpvgTuoXyC+SR3u+xsQvNR1fD1v+GAsMzw7pWXzWN6BWwTtkONSYK8Yi6gYtoxC1bQK
         v1eJ1oKrJ3yB1ApmDA+q6GNH/K080ezfWx5BEeQA1hd7M7GLxbP7JjiESrCDagoZ9XaN
         FCaw==
X-Forwarded-Encrypted: i=1; AFNElJ8OgSizARoRqrNXvNyVgtxNecoBGobLd1MzzcKiGts/9OlFn26Mar1JGV+5OIksKrLE9kI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz49ig28dBEvAW4Qute8WganzjKClpbYcQS4SpmcEHd5mAa90Op
	fO1Qs6B/88JzMUo5IMkHinsaZ/qhg1GhqHWinzDA8sebAPWlCFgj6tRNPqG+jtYu5ho=
X-Gm-Gg: Acq92OH7Hq5wfbdcyer9MuCIh6bnk043XsmE01khTSVNWhnIYOz/cXJnLPc6PHgObLt
	uDxhUSvkTzkdikzudATHtocqMXijQYJgxaBMoWAhKZWD+hPIOmMcl6CBLLGAHnNuP2XxV9w7WYv
	Gfwwq+L0JfSss9X+lfq52Y8Amigb5jW6UYrVz1ryu9uPyNQ21k4dafB3qwNSU8ZVrhY8wOMhfrj
	Mby1QB5GWTKuiMfVoKz1cVKUGIAH/kNDxmUvlPNKCVB67Cy9Vyvp/8/NfVbjYwlb8LUWO/3qe3G
	S5umUtr7ozcweiK0wW0sUPs/QcnpzFVXUSQUFegpZVGcJjjgx2fkacUJNuJedG+3xn6TssvUyJg
	1t0f7vYXXN3CajeMc6tlgaepWvL5zFowZIV8TZJy81+gBmbfqH/KeBUV0ABA0D0fA88H7zcv2bZ
	qQ1rQIujsO/k8N6jp4ZHC+vOhKyxNa2oQCTFS7JucD9ZiyGJLB8nNQzcic/MNZvbv/EmT+FLTS7
	2sArg==
X-Received: by 2002:ac2:4c55:0:b0:5aa:61ed:482c with SMTP id 2adb3069b0e04-5ad2db73743mr194365e87.6.1781251286462;
        Fri, 12 Jun 2026 01:01:26 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b7a3fsm319389e87.82.2026.06.12.01.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:01:25 -0700 (PDT)
Message-ID: <d4d75a39-3575-4bc7-9fa3-a6521619daca@linaro.org>
Date: Fri, 12 Jun 2026 11:01:24 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: shikra: Add CCI definitions
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-4-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-4-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index b93ce4a92a998ea5d9d4268d2fd46030fafc4084..fed71131491ebf6e261bfcd14b5d4a2624837878 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
>   			gpio-ranges = <&tlmm 0 0 165>;
>   			wakeup-parent = <&mpm>;
>   
> +			cci_i2c0_default: cci-i2c0-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c0_sleep: cci-i2c0-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci_i2c1_default: cci-i2c1-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c1_sleep: cci-i2c1-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
>   			qup_uart0_default: qup-uart0-default-state {
>   				pins = "gpio0", "gpio1";
>   				function = "qup0_se0";
> @@ -701,6 +733,44 @@ port@1 {
>   					reg = <1>;
>   				};
>   			};
> +
> +		};
> +
> +		cci: cci@5c1b000 {
> +			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x05c1b000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
> +
> +			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_0_CLK>;
> +			clock-names = "ahb",
> +				      "cci";
> +
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
> +			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
>   		};
>   
>   		qupv3_0: geniqup@4ac0000 {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
