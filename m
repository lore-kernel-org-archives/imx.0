Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0554535D4
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 20:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711398786; cv=none; b=M8QzEe6QqVNaKhBpODnwkhPpxAoyLIzBI6c+eJNHWc08jZOyrdL9jr6KD2Tu/AC4G2UlfAD7DeDA2w731XK7IjdvdN71WOJtdJ4NBb1WBDvRDgekF2aCFmoSTeejn3sprc7a66aRL4yZjsMpX0eXWL5VfKqwwqFqpWa8Vh3KQ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711398786; c=relaxed/simple;
	bh=zuzokH1Io0J6nQ9Vpc2m9tADHcKPN+WA5XzXwlf+NO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YexY1u7QswXwZrP544/317cn8UFEdP2pp3dg1WJM3x6WWjQk+1oaPm8JyV+hbqB6/L0cDzorKSDWbWBa7EbhIh5EAhjZHOVLvl2T7ezAGgZgv4+J21YDfuni/mz7mXXv+VURjH4n8M7mxCgI68Wy17mH2yHASXvs613rNku1W8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s2twUUJl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s2twUUJl"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BB152CFB;
	Mon, 25 Mar 2024 21:32:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711398746;
	bh=zuzokH1Io0J6nQ9Vpc2m9tADHcKPN+WA5XzXwlf+NO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s2twUUJleJVk6Gdzr4zJCEBaBsatB3Kou6HB6/RqBVU6DgDo6xmzjL93GQhfLJEtP
	 1HNKhgWlPW6g5aYBcEwctiuxvlrJZMrNkdy1glOTu2d8+TbWddbIqYlp9fiEOaiJjV
	 l1UJGJOkBuuxNtfRZ0oH3UHlpw1z6cNKiLV5D88k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Trevor Zaharichuk <trevor@au-zone.com>,
	Greg Lytle <greg@au-zone.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 3/5] dt-bindings: vendor-prefix: Add prefix for Au-Zone Technologies
Date: Mon, 25 Mar 2024 22:32:43 +0200
Message-ID: <20240325203245.31660-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
References: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Au-Zone Technologies is a company that designs and manufactures products
for AI vision applications. Add a DT vendor prefix for it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b97d298b3eb6..fce3d80c3d34 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -180,6 +180,8 @@ patternProperties:
     description: AU Optronics Corporation
   "^auvidea,.*":
     description: Auvidea GmbH
+  "^au-zone,.*":
+    description: Au-Zone Technologies
   "^avago,.*":
     description: Avago Technologies
   "^avia,.*":
-- 
Regards,

Laurent Pinchart

