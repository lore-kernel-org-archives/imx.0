Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8C1FCFF1
	for <imx@lists.linux.dev>; Wed, 14 May 2025 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206354; cv=none; b=eTo88pqd1MIMRS1QzG7bAln6253LAojQG9Rtf7HV9+5ZxaPdHm/LwHT9XZm+nx5qTHbrMybQsMjOeDXqofq5zIhpT9jMvyK4mB9e+C5ipGyvPKlYKPYBFrSW1Ai9207IGmgS8G7xxBKDSH+DumF1iLWpUa+/uzzn//SJTvpFc0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206354; c=relaxed/simple;
	bh=MlAwe0KDim9lB2A+cl+ofBu26pMokRaTACOI/0YspYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YnaGCWCqAgc/Syt8e9sWNDhTO8R7PAEdZJ+TBfit7WclFNLua7oaFbcpdJGWCOT/wsnztEHrI5q0aDmH688lovJ0hQlL7wnBcGt1F8F2bS9IozH4TjRd87X1kdq1OX/QJMMt0+HSfCdXEeQdhs7Oa3NB4q2h8wMbcscqwzuq0RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eVhQLcNo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eVhQLcNo"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf680d351so3415135e9.0
        for <imx@lists.linux.dev>; Wed, 14 May 2025 00:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747206351; x=1747811151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnMERAkqxqmioTW1rVTb8VFktf28RT8bmo3e4/AkA8s=;
        b=eVhQLcNoCghBGBAJ/P02qXVar1RmKBD0DaYw7Iw/6DTNQYVtGLzS+eF5aI41A77OLp
         MNSdf9s4vZmjPSg2O1QjnWbS9EjYzYWaEwhH8ZLQULiUI4BFB4dS9W2KX24NCaH0XdQM
         9nU5m8SVJszriL8WulTTt598wJU2QxlqVOqus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206351; x=1747811151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnMERAkqxqmioTW1rVTb8VFktf28RT8bmo3e4/AkA8s=;
        b=lmL/JLtQuHBKbQb1gksHaeP6w1ZBWca1MsiEqgwHvoqrS3QHlTXs2WsncfNLm8FaR6
         1Jee/s4CidYhwGTst5RdVSMdf3Z7L+4tG4hFsJzaj9YDrcyto52S+W9MdlgdWjVfDZoZ
         UA5aLNJNGkn4XE5gZgHxsFwIVUC4P1oAt0s6T4o/67mEYcTkOUk1EPTlR+vU1wERF7PY
         B+VXm8OmZQys7gtj2IGfRxDVsSN1JYppLNFnNXaiiRQ+RcnQdhuThUNpey16uHjXzgYg
         i5V1RmazszVlTmM3RZVEkF3PrfjQVxd5v5NS/6O20gQz+7Z58gpLUcFyqjqbqlksSkf6
         IU4A==
X-Forwarded-Encrypted: i=1; AJvYcCUkJObAQWSFZpP290dzQwXZ+qCWh7tLxG42XsThuf+h49tcz5CWLQurYZpaZp1YcDnpQnM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsxXSNYMErioSNfTnhCkvWqzgIQyUQTloOt7BGWRQ2puE7Pino
	odAb1tV7yNYBWF7RUb97G/P43xIiflywPU5dp4wRGLE8a55OKzRULjUetCgEpck=
X-Gm-Gg: ASbGncsoB+u6Op1XmwGDbUQKAunfDG4wqi1tqUd8PsAVJzMyN1+esOYCqzISTcnRToM
	DS3OQ9dif9zr56+PkpLWIT8ewn2XV0CISgq/NXEQ2Uvn9/6CEthfLFP+1eDuOoGL5ZXxDChlwp3
	ntwRIwB3JlaJJVExsMrNmhsn1hKJtg8S429mC/mwjqdQZJOvSTmvew4l780fZD6YrGEFUJUCbVZ
	rqllWaoWBvrH7oQOXbeiaWgrR/oVPDyBCOut4pX2Lo1s3RE2vRlk9VaenL+yJH7SuUagbyVncmB
	Wo5o5MrMiDZkcR5GEhZ8qAS9hf1Psywb6lDPC0w9yID7aig7/yOX5HAkJQT1yRpFK4skCusf/UX
	BivQ8URGORs9Ljyk/wkwtj2vKC4/jnu/CT6eqjTA0/qc=
X-Google-Smtp-Source: AGHT+IFJLzZyKmbngWgI+TzCZIEKEd11d7XNg6HIx4Hnb5kwZoKuTMfo+AMd0dF9M5np+Fv1sDDtKg==
X-Received: by 2002:a05:600c:37c7:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-442f1a428a5mr20748315e9.9.1747206350998;
        Wed, 14 May 2025 00:05:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c052sm16688175e9.29.2025.05.14.00.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:05:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] ARM: dts: imx6ulz-bsh-smm-m2: Enable uart2
Date: Wed, 14 May 2025 09:05:34 +0200
Message-ID: <20250514070545.1868850-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
References: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

uart2 is used as wake up source.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 5c32d1e3675c..fff21f28c552 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -37,6 +37,10 @@ &snvs_poweroff {
 	status = "okay";
 };
 
+&uart2 {
+	status = "okay";
+};
+
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-- 
2.43.0

base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
branch: bsh-202505-imx6ulz_smm_m2
